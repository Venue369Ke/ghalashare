class SectorExperiencesController < ApplicationController
  before_action :set_sector_experience, only: [:show, :edit, :update, :destroy]

  # GET /sector_experiences
  # GET /sector_experiences.json
  def index
    @sector_experiences = SectorExperience.all
  end

  # GET /sector_experiences/1
  # GET /sector_experiences/1.json
  def show
  end

  # GET /sector_experiences/new
  def new
    @sector_experience = SectorExperience.new
  end

  # GET /sector_experiences/1/edit
  def edit
  end

  # POST /sector_experiences
  # POST /sector_experiences.json
  def create
    @sector_experience = SectorExperience.new(sector_experience_params)

    respond_to do |format|
      if @sector_experience.save
        format.html { redirect_to @sector_experience, notice: 'Sector experience was successfully created.' }
        format.json { render :show, status: :created, location: @sector_experience }
      else
        format.html { render :new }
        format.json { render json: @sector_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sector_experiences/1
  # PATCH/PUT /sector_experiences/1.json
  def update
    respond_to do |format|
      if @sector_experience.update(sector_experience_params)
        format.html { redirect_to @sector_experience, notice: 'Sector experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @sector_experience }
      else
        format.html { render :edit }
        format.json { render json: @sector_experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sector_experiences/1
  # DELETE /sector_experiences/1.json
  def destroy
    @sector_experience.destroy
    respond_to do |format|
      format.html { redirect_to sector_experiences_url, notice: 'Sector experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector_experience
      @sector_experience = SectorExperience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sector_experience_params
      params.require(:sector_experience).permit(:experience_item, :warehouse_id)
    end
end
