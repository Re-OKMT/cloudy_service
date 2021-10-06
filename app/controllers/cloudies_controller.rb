class CloudiesController < ApplicationController
  
  before_action :set_cloudy, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
   @cloudies = Cloudy.includes(:user)
   #現在地追加のため記載
   #latitude = params[:latitude]
   #longitude = params[:longitude]
   #@cloudies = Cloudy.all.within(2, origin: [latitude, longitude])
  

  end

  def new
    @cloudy = Cloudy.new
  end

  def create
    # binding.pry
    @cloudy = Cloudy.new(cloudy_params)
    @cloudy.user_id = current_user.id
    if @cloudy.save
      redirect_to cloudy_path(@cloudy), notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def destroy
    cloudy = Cloudy.find(params[:id])
    cloudy.destroy
      redirect_to cloudies_path
  end

  def edit
    if @cloudy.user_id != current_user.id
      redirect_to cloudies_path, aleart: '不正なアクセスです'
    end
  end

  def update
    if @cloudy.update(cloudy_params)
      redirect_to cloudy_path(@cloudy), notice: "更新に成功しました"
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @cloudy.comments.includes(:user)
    @cloudy = Cloudy.find(params[:id])

    gon.cloudy = @cloudy  #追記
    

  end

    def maps
      gon.studios = Studio.all
    end

  def search
    @cloudies = SearchCloudiesService.search(params[:keyword])
    #追記
    latitude = params[:latitude]
    longitude = params[:longitude]

    #@places = Cloudy.all.within(2, origin: [latitude, longitude])
    @results = Geocoder.search([@latitude, @longitude])

  end
  
  private
  def cloudy_params
    params.require(:cloudy).permit(:image, :text, :address).merge(user_id: current_user.id)
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
