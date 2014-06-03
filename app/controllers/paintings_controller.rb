class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate
  #http_basic_authenticate_with name: Rails.application.secrets.marc_user_name, password: Rails.application.secrets.marc_password


  def index
    @paintings = Painting.all
    # if session[:admin] == false
    #   http_basic_authenticate_with name: Rails.application.secrets.marc_user_name, password: Rails.application.secrets.marc_password
    # end
    authenticate
  end

  # GET /paintings/1
  # GET /paintings/1.json
  def show
    
  end

  # GET /paintings/new
  def new
    @painting = Painting.new
  end

  # GET /paintings/1/edit
  def edit
    authenticate
  end

  # POST /paintings
  # POST /paintings.json
  def create
    authenticate
    @painting = Painting.new(painting_params)

    respond_to do |format|
      if @painting.save
        format.html { redirect_to @painting, notice: 'Painting was successfully created.' }
        format.json { render :show, status: :created, location: @painting }
      else
        format.html { render :new }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paintings/1
  # PATCH/PUT /paintings/1.json
  def update
    authenticate
    respond_to do |format|
      if @painting.update(painting_params)
        format.html { redirect_to @painting, notice: 'Painting was successfully updated.' }
        format.json { render :show, status: :ok, location: @painting }
      else
        format.html { render :edit }
        format.json { render json: @painting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paintings/1
  # DELETE /paintings/1.json
  def destroy
    authenticate
    @painting.destroy
    respond_to do |format|
      format.html { redirect_to paintings_url, notice: 'Painting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_painting
    @painting = Painting.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def painting_params
    params.require(:painting).permit(:photo, :title, :description, :created_at, :updated_at, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at)
  end

  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      if user_name == Rails.application.secrets.marc_user_name && password == Rails.application.secrets.marc_password
        session[:admin] = true
      else
        session[:admin] = false
      end
    end
  end

end
