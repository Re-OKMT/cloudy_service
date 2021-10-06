class UsersController < ApplicationController
  
  def show
    @nickname = current_user.nickname
    @cloudies = current_user.cloudies
  end

  def index
    @user = User.find_by(id: current_user.id)
  end


  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
