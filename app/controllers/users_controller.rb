class UsersController < ApplicationController
  
  def show
    user = User.find(params[:id])
    @name = user.name
    @cloudies = user.cloudies
  end
end
