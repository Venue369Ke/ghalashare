class WarehousesController < ApplicationController
  before_action :set_warehouse, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :amenities,:location, :update]



  # GET /warehouses
  # GET /warehouses.json
  def index

    warehouses=[]

       current_user.warehouses.each do |warehouse|
       warehouses.push(warehouse)
      end




    @warehouses = warehouses
  end

  # GET /warehouses/1
  # GET /warehouses/1.json
  def show
    if current_user== @warehouse.user
      flash[:alert]= "You cannot book your own property"

    end
    @photos=@warehouse.photos
    @guest_reviews= @warehouse.guest_reviews
  end

  # GET /warehouses/new
  def new
    @warehouse = current_user.warehouses.build
    @my_companies=current_user.companies
  end

  # GET /warehouses/1/edit
  def edit
  end

  # POST /warehouses
  # POST /warehouses.json
  def create
    if !current_user.is_active_host
    return redirect_to payout_method_path, alert: "Please Connect to your Bank/MPESA account  first."
  end


@warehouse = current_user.warehouses.build(warehouse_params)

#@output_service=params[:warehouse][:services].count
@selected_services=params[:warehouse][:services]
@selected_warehousetypes=params[:warehouse][:warehousetypes]
@selected_sectorexperiences=params[:warehouse][:warehousetypes]
@selected_certificates=params[:warehouse][:certificates]
@selected_configs=params[:warehouse][:configs]
@selected_connections=params[:warehouse][:connections]
@selected_equipment=params[:warehouse][:equipment]




      if @warehouse.save
        redirect_to listing_warehouse_path(@warehouse), notice: "Saved..."

      else
         render :new, notice: "Something went wrong..."

      end



    #assigned services

    if @selected_services !=nil

      services_container=[]

      @selected_services.each do |service_id|
unless service_id.empty?
           service=Service.find(service_id)
           services_container.push(service)
end

      end
    end

    #assigned warehousetypes



        if @selected_warehousetypes !=nil

          warehousetypes_container=[]

          @selected_warehousetypes.each do |warehousetype_id|
    unless warehousetype_id.empty?
               warehousetype=Warehousetype.find(warehousetype_id)
               warehousetypes_container.push(warehousetype)
    end

          end
        end

        #assigned sector_experiences
        if @selected_sectorexperiences !=nil

          sectorexperiences_container=[]

          @selected_sectorexperiences.each do |sectorexperiences_id|
      unless sectorexperiences_id.empty?
               sectorexperience = SectorExperience.find(sectorexperiences_id)
               sectorexperiences_container.push(sectorexperience)
      end

          end
        end


        #assigned configs
        if @selected_configs !=nil

          configs_container=[]

          @selected_configs.each do |config_id|
      unless config_id.empty?
               config = Config.find(config_id)
               configs_container.push(config)
      end

          end
        end


        #assigned connections
      if @selected_connections !=nil

        connections_container=[]

        @selected_connections.each do |connection_id|
    unless connection_id.empty?
             connection = Connection.find(connection_id)
             connections_container.push(connection)
    end

        end
      end


      #assigned equipment
            if @selected_equipment !=nil

              equipment_container=[]

              @selected_equipment.each do |equipment_id|
          unless equipment_id.empty?
                   equipment = Equipment.find(equipment_id)
                   equipment_container.push(equipment)
          end

              end
            end
if !@warehouse.nil?

   #@warehouse.assign_service(@warehouse,services_container)
   @warehouse.assign_warehousetype(@warehouse,warehousetypes_container)
   @warehouse.assign_sectorexperience(@warehouse,sectorexperiences_container)
   #@warehouse.assign_config(@warehouse,configs_container)
   #@warehouse.assign_connection(@warehouse,connections_container)
   #@warehouse.assign_equipment(@warehouse,equipment_container)
end



  end

  # PATCH/PUT /warehouses/1
  # PATCH/PUT /warehouses/1.json
  def update

new_params= warehouse_params
new_params= warehouse_params.merge(active: true) if is_ready_warehouse
    #@output_service=params[:warehouse][:services].count
    if params[:warehouse]
    @selected_services=params[:warehouse][:services]
    @selected_warehousetypes=params[:warehouse][:warehousetypes]
    @selected_sectorexperiences=params[:warehouse][:warehousetypes]
    @selected_certificates=params[:warehouse][:certificates]
    @selected_configs=params[:warehouse][:configs]
    @selected_connections=params[:warehouse][:connections]
    @selected_equipment=params[:warehouse][:equipment]

end

      if @warehouse.update(warehouse_params)
        flash[:notice]="Your warehouse was successfully updated."
        #format.html { redirect_to @warehouse, notice: 'Warehouse was successfully updated.' }
      redirect_back(fallback_location: request.referer)
      else
        render :edit, notice: 'Something went wrong ...'

      end


      #assigned services

      if @selected_services !=nil

        services_container=[]

        @selected_services.each do |service_id|
    unless service_id.empty?
             service=Service.find(service_id)
             services_container.push(service)
    end

        end
         @warehouse.assign_service(@warehouse,services_container)
      end

      #assigned warehousetypes



          if @selected_warehousetypes !=nil

            warehousetypes_container=[]

            @selected_warehousetypes.each do |warehousetype_id|
      unless warehousetype_id.empty?
                 warehousetype=Warehousetype.find(warehousetype_id)
                 warehousetypes_container.push(warehousetype)
      end

            end
            @warehouse.assign_warehousetype(@warehouse,warehousetypes_container)
          end

          #assigned sector_experiences
          if @selected_sectorexperiences !=nil

            sectorexperiences_container=[]

            @selected_sectorexperiences.each do |sectorexperiences_id|
        unless sectorexperiences_id.empty?
                 sectorexperience = SectorExperience.find(sectorexperiences_id)
                 sectorexperiences_container.push(sectorexperience)
        end

            end
               @warehouse.assign_sectorexperience(@warehouse,sectorexperiences_container)
          end


          #assigned configs
          if @selected_configs !=nil

            configs_container=[]

            @selected_configs.each do |config_id|
        unless config_id.empty?
                 config = Config.find(config_id)
                 configs_container.push(config)
        end

            end
               @warehouse.assign_config(@warehouse,configs_container)
          end


          #assigned connections
        if @selected_connections !=nil

          connections_container=[]

          @selected_connections.each do |connection_id|
      unless connection_id.empty?
               connection = Connection.find(connection_id)
               connections_container.push(connection)
      end

          end
           @warehouse.assign_connection(@warehouse,connections_container)
        end


        #assigned equipment
              if @selected_equipment !=nil

                equipment_container=[]

                @selected_equipment.each do |equipment_id|
            unless equipment_id.empty?
                     equipment = Equipment.find(equipment_id)
                     equipment_container.push(equipment)
            end

                end
                @warehouse.assign_equipment(@warehouse,equipment_container)
              end








  end

  # DELETE /warehouses/1
  # DELETE /warehouses/1.json
  def destroy
    @warehouse.destroy
    respond_to do |format|
      format.html { redirect_to warehouses_url, notice: 'Warehouse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def listing

  end

  def pricing

  end
   def description

   end


   def photo_upload

      @photos= @warehouse.photos






   end

   def amenities

   end

   def location

   end

def preload
  today= Date.today

  reservations =@warehouse.reservations.where('(start_date>= ? OR end_date >=?) AND status=?', today, today,1)
  unavailable_dates = @warehouse.calendars.where("status = ? AND day > ?", 1, today)
  special_dates = @warehouse.calendars.where("status = ? AND day > ? AND price <> ?",0, today, @warehouse.price)


  render json: {
         reservations: reservations,
         unavailable_dates: unavailable_dates,
         special_dates: special_dates
     }

end


def preview

  start_date = Date.parse(params[:start_date])
  end_date = Date.parse(params[:end_date])


  output = {
    conflict: is_conflict(start_date, end_date, @warehouse)
  }

     render json: output

end
  private
    # Use callbacks to share common setup or constraints between actions.


    def is_conflict(start_date, end_date, warehouse)
      check = warehouse.reservations.where("(? < start_date AND end_date < ?) AND status = ?", start_date, end_date, 1)
      check_2 = warehouse.calendars.where("day BETWEEN ? AND ? AND status = ?", start_date, end_date, 1).limit(1)

      check.size > 0 || check_2.size > 0 ? true : false
    end
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def is_authorised

      redirect_to root_path, alert: "You don't have permission" unless current_user.id== @warehouse.user_id
    end
 def is_ready_warehouse

   !@warehouse.active && !@warehouse.price.blank? && !@warehouse.address.blank? && !@warehouse.photos.blank? && !@warehouse.title.blank? && !@warehouse.total_size.blank? && !@warehouse.services.blank?

 end
    # Never trust parameters from the scary internet, only allow the white list through.
    def warehouse_params
      params.require(:warehouse).permit(:title, :total_size, :description, :youtube_url,:user_id, :company_id,:price,:address,:active, :instant, :warehousecategory_id)
    end
end
