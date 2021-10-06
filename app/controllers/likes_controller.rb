class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(cloudy_id: params[:cloudy_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cloudy = Cloudy.find(params[:cloudy_id])
    @like =  current_user.likes.find_by(cloudy_id: @cloudy.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
