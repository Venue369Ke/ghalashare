class PagesController < ApplicationController
  def home
  @warehouses =Warehouse.where(active: true).limit(3)
  end



  def search
    if params[:search].present? && params[:search].strip !=""


      session[:loc_search] = params[:search]

    end


arrResult = Array.new


    if session[:loc_search] && session[:loc_search] != ""

      @warehouses_address= Warehouse.where(active: true).near(session[:loc_search],5,order: 'distance')

    else

      @warehouses_address = Warehouse.where(active: true).all

end
 @search= @warehouses_address.ransack(params[:q])
 @warehouses = @search.result


 @arrWarehouses = @warehouses.to_a


 # STEP 4
    if (params[:start_date] && params[:end_date] && !params[:start_date].empty? &&  !params[:end_date].empty?)

      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])

      @warehouses.each do |warehouse|

        not_available = warehouse.reservations.where(
          "((? <= start_date AND start_date <= ?)
          OR (? <= end_date AND end_date <= ?)
          OR (start_date < ? AND ? < end_date))
          AND status =?",
          start_date, end_date,
          start_date, end_date,
          start_date, end_date,
          1
        ).limit(1)

        not_available_in_calendar = Calendar.where(
        "warehouse_id = ? AND status = ? AND day <= ? AND day >= ?",
        warehouse.id, 1, end_date, start_date
      ).limit(1)

        if not_available.length > 0 || not_available_in_calendar.length > 0
          @arrWarehouses.delete(warehouse)
        end
      end
    end
end


def privacy_policy


end

end
