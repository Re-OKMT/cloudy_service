class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to cloudy_path(@comment.cloudy)
    else
    @cloudy = @comment.cloudy
    @comments = @cloudy.comments
    render "cloudies/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, cloudy_id: params[:cloudy_id])
  end
end
