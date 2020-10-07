class WarehousetypesController < ApplicationController
  before_action :set_warehousetype, only: [:show, :edit, :update, :destroy]

  # GET /warehousetypes
  # GET /warehousetypes.json
  def index
    @warehousetypes = Warehousetype.all
  end

  # GET /warehousetypes/1
  # GET /warehousetypes/1.json
  def show
  end

  # GET /warehousetypes/new
  def new
    @warehousetype = Warehousetype.new
  end

  # GET /warehousetypes/1/edit
  def edit
  end

  # POST /warehousetypes
  # POST /warehousetypes.json
  def create
    @warehousetype = Warehousetype.new(warehousetype_params)

    respond_to do |format|
      if @warehousetype.save
        format.html { redirect_to @warehousetype, notice: 'Warehousetype was successfully created.' }
        format.json { render :show, status: :created, location: @warehousetype }
      else
        format.html { render :new }
        format.json { render json: @warehousetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warehousetypes/1
  # PATCH/PUT /warehousetypes/1.json
  def update
    respond_to do |format|
      if @warehousetype.update(warehousetype_params)
        format.html { redirect_to @warehousetype, notice: 'Warehousetype was successfully updated.' }
        format.json { render :show, status: :ok, location: @warehousetype }
      else
        format.html { render :edit }
        format.json { render json: @warehousetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warehousetypes/1
  # DELETE /warehousetypes/1.json
  def destroy
    @warehousetype.destroy
    respond_to do |format|
      format.html { redirect_to warehousetypes_url, notice: 'Warehousetype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehousetype
      @warehousetype = Warehousetype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def warehousetype_params
      params.require(:warehousetype).permit(:type_item, :warehouse_id)
    end
end
