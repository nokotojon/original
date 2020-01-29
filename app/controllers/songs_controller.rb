class SongsController < ApplicationController
  def index
    @songs = Song.all.includes(:favorite_users)
    @songs = Song.all.order(created_at: :desc)
  end
  
  def rank
    @all_ranks = Song.find(Favorite.group(:song_id).order('count(song_id) desc').limit(3).pluck(:song_id))
  end
  
  def sort
    @dates = Song.where(created_at: params[:start_date]..params[:end_date])
    
    if @dates.save
      redirect_to songs_path, success:'設定に成功しました'
    else
      flash.now[:danger] = '設定に失敗しました'
    end
  end
  
  def new
    @song = Song.new
  end
  
  def create
    
    @song = current_user.songs.new(song_params)
    
    if @song.save
      redirect_to songs_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  private
  def song_params
    params.require(:song).permit(:title, :rylic, :video)
  end
end
