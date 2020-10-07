require 'rave_ruby'
class ReservationsController < ApplicationController
before_action :authenticate_user!
before_action :set_reservation, only: [:approve,:decline]

  def create
warehouse= Warehouse.find(params[:warehouse_id])
status=params[:commit]


if current_user== warehouse.user
  flash[:alert]= "You cannot book your own property"
# elsif current_user.stripe_id.blank?
#     flash[:alert]= "Please update your payment method"
#     return redirect_to payment_method_path
elsif current_user.phone_number.blank?
  flash[:alert]= "Kindly update your phone number under your profile before making any booking, to do so click on Edit Profile from on the upper right"



elsif !current_user.phone_number.blank? && current_user.phone_verified==false
  flash[:alert]= "Kindly verify phone number with the code sent to your phone"


else
start_date= Date.parse(reservation_params[:start_date])

end_date= Date.parse(reservation_params[:end_date])


days=(end_date-start_date).to_i+1
special_dates = warehouse.calendars.where(
        "status = ? AND day BETWEEN ? AND ? AND price <> ?",
        0, start_date, end_date, warehouse.price
)

@reservation= current_user.reservations.build(reservation_params)
@reservation.warehouse= warehouse
@reservation.price= warehouse.price
#@reservation.total= warehouse.price * days
#@reservation.save
@reservation.total = warehouse.price * (days - special_dates.count)
      special_dates.each do |date|
          @reservation.total += date.price
      end

  if @reservation.Waiting!
        if warehouse.Request?
          flash[:notice] = "Request sent successfully!"
        else

          charge(warehouse, @reservation,status)
        end
      else
        flash[:alert] = "Cannot make a reservation!"
  end

end
redirect_to warehouse
end

def your_reservations
@warehouses = current_user.warehouses
end

def your_storage_bookings

  @bookings=current_user.reservations.order(:start_date, :end_date)

end


def approve
charge(@reservation.warehouse, @reservation)
      redirect_to your_reservations_path
end
def decline
  @reservation.Declined!
     redirect_to your_reservations_path
end
private


def send_sms(warehouse, reservation)


  @client = Twilio::REST::Client.new
  @client.messages.create(
    from: '+15005550006',
    to: warehouse.user.phone_number,
    body: "#{reservation.user.fullname} booked your '#{warehouse.title}'"
  )
end

def charge(warehouse, reservation,status)

  # if !reservation.user.stripe_id.blank?
  #
  #   customer = Stripe::Customer.retrieve(reservation.user.stripe_id)
  #
  #   charge = Stripe::Charge.create(
  #     :customer => customer.id,
  #     :amount => (reservation.total * 100).to_i,
  #     :description => warehouse.title,
  #     :currency => "usd",
  #     :destination => {
  #           :amount => (reservation.total * 80).to_i, # 80% of the total amount goes to the Host
  #           :account => warehouse.user.merchant_id # Host's Stripe customer ID
  #         }
  #
  #
  #   )
  #    logger.debug "#{charge}"

    if status=='00'

      reservation.Approved!
      ReservationMailer.send_email_to_guest(reservation.user, warehouse).deliver_later if reservation.user.setting.enable_email
      send_sms(warehouse, reservation) if warehouse.user.setting.enable_sms && warehouse.user.phone_verified
    flash[:notice] = "Reservation created successfully!"


    else
      reservation.Declined!
      flash[:alert]= "Cannot charge with this payment method!"


    end




end
# rescue Stripe::CardError => e
#   reservation.declined!
#   flash[:alert]= e.message
# end



def set_reservation
  @reservation= Reservation.find(params[:id])

end
  def reservation_params

    params.require(:reservation).permit(:start_date, :end_date, :booking_size)

  end
end
