class CafesController < ApplicationController
  before_filter :set_cafe, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index]
  respond_to :html

  def index
    @cafes = Cafe.all
    respond_with(@cafes)
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
