class CloudiesController < ApplicationController
  before_action :set_cloudy, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
   # @cloudoes = Cloudy.includes(:user).order("created_at DESC")
   @cloudies = Cloudy.includes(:user)
  end

  def new
    @cloudy = Cloudy.new
  end

  def create
    # binding.pry
    @cloudy = Cloudy.new(cloudy_params)
    if @cloudy.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @cloudy.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @cloudy.update(cloudy_params)
      redirect_to cloudy_path(@cloudy)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @cloudy.comments.includes(:user)
  end

  def search
    @cloudies = SearchCloudiesService.search(params[:keyword])
  end
  
  private
  def cloudy_params
    params.require(:cloudy).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_cloudy
    @cloudy = Cloudy.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
