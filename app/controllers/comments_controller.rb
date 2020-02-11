class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.song_id = params[:song_id]
    @comment.user_id = current_user.id
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to songs_path, success: 'コメントを投稿しました'
    else
      redirect_to songs_path, danger: 'コメントの投稿に失敗しました'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:user_id, :song_id, :comment)
  end
  
end
