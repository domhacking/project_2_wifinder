class CafesController < ApplicationController
  before_filter :set_cafe, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]
  respond_to :html, :json

  helper_method :is_favorite?

  def is_favorite?(cafe, user)
    faves = user.favorite_cafes.map do |fave|
      fave.cafe_id
    end
    faves.include?(cafe.id)
  end
  
  # Add and remove favorite cafes for current_user
  def favorite
    type = params[:type]
    @cafe = Cafe.find(params[:id])
    if type == "favorite"
      current_user.favorite_cafes.create(cafe_id: params[:id])
      redirect_to :back

    elsif type == "unfavorite"
      @fave = current_user.favorite_cafes.where(cafe_id: params[:id]).first
      @fave.delete
      redirect_to :back

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def index
    @cafes = Cafe.all
    if current_user
      if current_user.favorite_cafes.any?
        @faves = Cafe.findFaves(current_user)
      end
    end
    # binding.pry
    
    respond_to do |format|
      format.html # index.html.erb
      format.js do
        ne = params[:ne].split(',').collect{|e|e.to_f}  
        sw = params[:sw].split(',').collect{|e|e.to_f}
        @cafes = Cafe.withinBounds(sw, ne)
        render json: @cafes
      end
    end
  end

  def show

    respond_with(@cafe)

  end

  def new
    @cafe = Cafe.new
    respond_with(@cafe)
  end

  def edit
  end

  def create
    @cafe = Cafe.new(params[:cafe])
    @cafe.save
    current_user.cafe_users.create(cafe_id: @cafe.id)
    respond_with(@cafe)
  end

  def update
    @cafe.update_attributes(params[:cafe])
    respond_with(@cafe)
  end

  def destroy
    @cafe.destroy
    respond_with(@cafe)
  end

  private
  def set_cafe
    @cafe = Cafe.find(params[:id])
  end
end
