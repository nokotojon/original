class VotesController < ApplicationController
  def index
    @vote_rappers = current_user.favorite_topics
  end
  
  def create
    vote = Vote.new
    vote.user_id = current_user.id
    vote.rapper_id = params[:rapper_id]
    
    if vote.save
      redirect_to rappers_path, success: 'お気に入りに登録しました'
    else
      redirect_to rappers_path, danger:  'お気に入り登録に失敗しました'
    end
  end
  
  def destroy
    @vote = Vote.find_by(user_id: current_user.id,
                                 rapper_id: params[:rapper_id])
    @vote.destroy
    redirect_to rappers_path, success: 'お気に入りを解除しました'
  end
end
