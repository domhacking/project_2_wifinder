class CafesUserController < ApplicationController
  # GET /cafes_user
  # GET /cafes_user.json
  def index
    @cafes_user = CafeUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cafes_user }
    end
  end

  # GET /cafes_user/1
  # GET /cafes_user/1.json
  def show
    @cafes_user = CafeUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cafes_user }
    end
  end

  # GET /cafes_user/new
  # GET /cafes_user/new.json
  def new
    @cafes_user = CafeUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cafes_user }
    end
  end

  # GET /cafes_user/1/edit
  def edit
    @cafes_user = CafeUser.find(params[:id])
  end

  # POST /cafes_user
  # POST /cafes_user.json
  def create
    @cafes_user = CafeUser.new(params[:cafe_user])
    # binding.pry
    # @cafes_user.cafe_id = @cafe_id
    @cafes_user.user_id = current_user.id
    # @cafes_user = 
    
    respond_to do |format|
      if @cafes_user.save
        format.html { redirect_to cafes_url, notice: 'Cafe user was successfully created.' }
        format.json { render json: cafes_url, status: :created, location: cafes_url }
      else
        format.html { render action: "new" }
        format.json { render json: cafes_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cafes_user/1
  # PUT /cafes_user/1.json
  def update
    @cafes_user = CafeUser.find(params[:id])

    respond_to do |format|
      if @cafes_user.update_attributes(params[:cafes_user])
        format.html { redirect_to @cafes_user, notice: 'Cafe user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cafes_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cafes_user/1
  # DELETE /cafes_user/1.json
  def destroy
    @cafes_user = CafeUser.find(params[:id])
    @cafes_user.destroy

    respond_to do |format|
      format.html { redirect_to cafes_user_url }
      format.json { head :no_content }
    end
  end
end
