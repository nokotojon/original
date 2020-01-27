class UsersController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update]}
  
  def index
  @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    
    if @user.update_attributes(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to user_path
      
    else
      render("/users/edit")
    end
  end
  
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "ユーザー編集の権限がありません。　このユーザーを編集する場合は、一度ログアウトし、このユーザーで再度ログインしてください。"
      redirect_to users_path
    end
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:image)
  end
end
