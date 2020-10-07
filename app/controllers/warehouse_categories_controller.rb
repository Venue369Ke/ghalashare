class WarehouseCategoriesController < ApplicationController
  before_action :set_warehouse_category, only: [:show, :edit, :update, :destroy]

  # GET /warehouse_categories
  # GET /warehouse_categories.json
  def index
    @warehouse_categories = WarehouseCategory.all
  end

  # GET /warehouse_categories/1
  # GET /warehouse_categories/1.json
  def show
  end

  # GET /warehouse_categories/new
  def new
    @warehouse_category = WarehouseCategory.new
  end

  # GET /warehouse_categories/1/edit
  def edit
  end

  # POST /warehouse_categories
  # POST /warehouse_categories.json
  def create
    @warehouse_category = WarehouseCategory.new(warehouse_category_params)

    respond_to do |format|
      if @warehouse_category.save
        format.html { redirect_to @warehouse_category, notice: 'Warehouse category was successfully created.' }
        format.json { render :show, status: :created, location: @warehouse_category }
      else
        format.html { render :new }
        format.json { render json: @warehouse_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warehouse_categories/1
  # PATCH/PUT /warehouse_categories/1.json
  def update
    respond_to do |format|
      if @warehouse_category.update(warehouse_category_params)
        format.html { redirect_to @warehouse_category, notice: 'Warehouse category was successfully updated.' }
        format.json { render :show, status: :ok, location: @warehouse_category }
      else
        format.html { render :edit }
        format.json { render json: @warehouse_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouse_categories/1
  # DELETE /warehouse_categories/1.json
  def destroy
    @warehouse_category.destroy
    respond_to do |format|
      format.html { redirect_to warehouse_categories_url, notice: 'Warehouse category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse_category
      @warehouse_category = WarehouseCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def warehouse_category_params
      params.require(:warehouse_category).permit(:category, :category_description, :warehouse_id)
    end
end
