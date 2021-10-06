class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    redirect_to "/cloudies/#{comment.cloudy.id}"  
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, cloudy_id: params[:cloudy_id])
  end
end
