class FavoritesController < ApplicationController
  def index
    @favorite_songs = current_user.favorite_songs
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.song_id = params[:song_id]
    
    if favorite.save
      redirect_to songs_path, success: 'お気に入りに登録しました'
    else
      redirect_to songs_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id,
                                 song_id: params[:song_id])
    @favorite.destroy
    redirect_to songs_path, success: 'お気に入りを解除しました'
  end
  
end
