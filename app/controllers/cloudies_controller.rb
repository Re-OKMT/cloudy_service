class CloudiesController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show]
  before_action :set_cloudy, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, except: [:index, :show,]


  def index
    @cloudies = Cloudy.includes(:user).order("created_at DESC")
  end

  def new
    @cloudy = Cloudy.new
  end

  def create
    Cloudy.create(cloudy_params)
  end

  def destroy
    cloudy = Cloudy.find(params[:id])
    cloudy.destroy
  end

  def edit
  end

  def update
    cloudy = Cloudy.find(params[:id])
    cloudy.update(cloudy_params)
  end

  def show
  end

  private
  def cloudy_params
    params.require(:cloudy).permit(:name,:image, :text).merge(id: current_user.id)
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
