class RappersController < ApplicationController
  def index
    @rappers = Rapper.all
  end
  
  def new
    @rapper = Rapper.new
  end
  
  def create
    @rapper = Rapper.new(rapper_params)
    if @rapper.save
      redirect_to rappers_new_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def show
    @rapper = Rapper.find_by(id: params[:id])
  end
  
  def edit
    @rapper = Rapper.find_by(id: params[:id])
  end
  
  def update
    @rapper = Rapper.find_by(id: params[:id])
    @rapper.name = params[:name]
    @rapper.furigana_name = params[:furigana_name]
    @rapper.represent_area = params[:represent_area]
    @rapper.crew = params[:crew]
    @rapper.sns_account = params[:sns_account]
    @rapper.introduction = params[:introduction]
    @rapper.age = params[:age]
    @rapper.rhyme = params[:rhyme]
    @rapper.flow = params[:flow]
    @rapper.talk = params[:talk]
    @rapper.props = params[:props]
    @rapper.synthesis = params[:synthesis]
    
    
    if @rapper.update_attributes(rapper_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to rapper_path
      
    else
      render("/rappers/edit")
    end
  end
  
  def destroy 
    @rapper = Rapper.find_by(id: params[:id])
    @rapper.destroy
    redirect_to rappers_index_path, success: '削除完了!!'
  end
  
  private
  def rapper_params
    params.require(:rapper).permit(:name, :furigana_name, :represent_area, :crew, :sns_account, :introduction, :image, :vote, :age, :rhyme, :flow, :talk, :props, :synthesis)
  end  
  

end
