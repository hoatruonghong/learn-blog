require 'fileutils'

class MicropostsController < ApplicationController
  protect_from_forgery with: :null_session

  # TOKEN = "secret"
  # skip_before_action :verify_authenticity_token
  # before_action :authenticate, except: [:index]
  before_action :set_micropost, only: %i[ show edit update destroy upload_multiple_file upload_single_file]

  # GET /microposts or /microposts.json
  def index
    @microposts = Micropost.all
    render json: @microposts
  end

  # GET /microposts/1 or /microposts/1.json
  def show
    render json: @micropost
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  def edit
  end

  # POST /microposts or /microposts.json
  def create
    puts(params)
    puts(micropost_params)
    @micropost = Micropost.new(micropost_params)   
    respond_to do |format|
      if @micropost.save
        #format.html { redirect_to micropost_url(@micropost), notice: "Micropost was successfully created." }
        format.json { render :show, status: :created, location: @micropost }
      else
        #format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /microposts/1/upload-file
  def upload_single_file
    puts(@micropost)
    puts(params)
    uploaded_io = params[:picture]
    FileUtils.mkdir 'public/uploads' unless File.exist?('public/uploads')
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)    
    end
    @micropost.update(picture: "public/uploads/"+uploaded_io.original_filename)

    render json: {res: {status: 200, picture_path: "public/uploads/"+uploaded_io.original_filename}}
  end
  
  # # POST /microposts/1/upload-files
  # def upload_multiple_file

  # end
  
  # PATCH/PUT /microposts/1 or /microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        #format.html { redirect_to micropost_url(@micropost), notice: "Micropost was successfully updated." }
        format.json { render :show, status: :ok, location: @micropost }
      else
        #format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /microposts/1 or /microposts/1.json
  def destroy
    @micropost.destroy

    respond_to do |format|
      format.html { redirect_to microposts_url, notice: "micropost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def micropost_params
      params.require(:micropost).permit(:content, :user_id)
    end

    # def authenticate
    #   authenticate_or_request_with_http_token do |token, options|
    #     # Compare the tokens in a time-constant manner, to mitigate
    #     # timing attacks.
    #     ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    #   end
    # end
end
