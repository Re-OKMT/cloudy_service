class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #@nickname = user.nickname
    #@cloudies = user.cloudies
  end

  #def index
  #  @user = User.find_by(id: current_user.id)
  #end


  def edit
  end

  def update
  end


end
