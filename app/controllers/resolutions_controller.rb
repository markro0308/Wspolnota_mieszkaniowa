class ResolutionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_access, only: %i[new create edit update destroy]
  before_action :set_resolution, only: %i[ show edit update destroy upvote downvote]

  # GET /resolutions or /resolutions.json
  def index
    @resolutions = Resolution.all
  end

  # GET /resolutions/1 or /resolutions/1.json
  def show
  end

  # GET /resolutions/new
  def new
    @resolution = Resolution.new
  end

  # GET /resolutions/1/edit
  def edit
  end

  # POST /resolutions or /resolutions.json
  def create
    @resolution = Resolution.new(resolution_params)

    respond_to do |format|
      if @resolution.save
        format.html { redirect_to @resolution, notice: "Uchwała została pomyślnie utworzona." }
        format.json { render :show, status: :created, location: @resolution }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resolutions/1 or /resolutions/1.json
  def update
    respond_to do |format|
      if @resolution.update(resolution_params)
        format.html { redirect_to @resolution, notice: "Uchwała została pomyślnie zaktualizowana." }
        format.json { render :show, status: :ok, location: @resolution }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resolution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resolutions/1 or /resolutions/1.json
  def destroy
    @resolution.destroy
    respond_to do |format|
      format.html { redirect_to resolutions_url, notice: "Uchwała została pomyślnie usunięta." }
      format.json { head :no_content }
    end
  end

  def upvote
    if current_user.voted_up_on? @resolution
      @resolution.unvote_by current_user, :vote_weight => current_user.part
    else
      @resolution.upvote_by current_user, :vote_weight => current_user.part
    end
    redirect_to resolution_path
  end

  def downvote  
    if current_user.voted_down_on? @resolution
      @resolution.unvote_by current_user, :vote_weight => current_user.part
    else 
      @resolution.downvote_by current_user, :vote_weight => current_user.part
    end
    redirect_to resolution_path
  end   

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resolution
      @resolution = Resolution.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resolution_params
      params.require(:resolution).permit(:titleR, :contentR, :votable)
    end 

end
