require 'uri'
require 'net/http'
require 'json'
require 'rave_ruby'
require 'ostruct'

class UsersController < ApplicationController

  def show
@user=User.find(params[:id])
@warehouses= @user.warehouses

#Display all the guest reviews to host(if this user is a host)

@guest_reviews = Review.where(type: "GuestReview", host_id: @user.id)


#Display all the guest reviews to host(if this user is a host)

@host_reviews = Review.where(type: "HostReview", host_id: @user.id)


  end


  def update_phone_number
    current_user.update_attributes(user_params)
    current_user.generate_pin
    current_user.send_pin

    redirect_to edit_user_registration_path, notice: "Saved..."
  rescue Exception => e
    redirect_to edit_user_registration_path, alert: "#{e.message}"
  end

  def verify_phone_number
    current_user.verify_pin(params[:user][:pin])

    if current_user.phone_verified
      flash[:notice] = "Your phone number is verified."
    else
      flash[:alert] = "Cannot verify your phone number."
    end

    redirect_to edit_user_registration_path

  rescue Exception => e
    redirect_to edit_user_registration_path, alert: "#{e.message}"
  end

def payment


end

def edit_payout
  connect_api()
subaccount = SubAccount.new(@rave)
if !current_user.subaccount.blank?
  begin
response = subaccount.delete_subaccount(current_user.subaccount)
print response

rescue => error
end
end
if error
  flash[:alert] = error.message
  current_user.subaccount=""
  current_user.save
end
begin
get_banks()
rescue => error
end
if error
  flash[:alert] = error.message

end



end

def payout

@user=User.new


@data_array=["id", "account_number", "account_bank", "fullname", "date_created"]

connect_api()
subaccount = SubAccount.new(@rave)

if current_user.subaccount.blank?

begin
get_banks()
rescue => error
end
if error
  flash[:alert] = error.message

end


else

begin
  @acc=current_user.subaccount
  @response = subaccount.fetch_subaccount(@acc)
  print @response
rescue => error
end
if error
    flash[:alert] =error.message
end
end



end

def create_subaccount
  # This is a rave object which is expecting public and secret keys

  connect_api()

  payload = {
  	"account_bank" => params[:account_bank],
  	"account_number" => params[:account_number],
  	"business_name" => params[:business_name],
  	"business_email" => current_user.email,
  	"business_contact" => current_user.fullname,
  	"business_contact_mobile" =>params[:business_mobile],
  	"business_mobile" => params[:business_mobile],
    "country" => "KE",
      "split_type" => "percentage",
      "split_value" => 0.1,
  	"meta" => [{"metaname": "MarketplaceID", "metavalue": ENV['MARKETPLACE_ID']}]
  }

  # Instantiate the subaccount object
  subaccount = SubAccount.new(@rave)

  # This is used to create a subaccount
  begin
     @response = subaccount.create_subaccount(payload)

    puts @response
rescue => error
end
  if error
    flash[:alert] = error.message




elsif    @response["error"]==false

  @subaccount= @response["data"]["subaccount_id"]
  current_user.subaccount = @subaccount


  if   current_user.save


  flash[:notice] = "Your payout method has been updated successfully."

else

  flash[:alert] = "Your payout method has not updated. Please try again."

  end
end


  redirect_to payout_method_path


end

# def add_card
#    if current_user.stripe_id.blank?
#      customer = Stripe::Customer.create(
#        email: current_user.email
#      )
#      current_user.stripe_id = customer.id
#      current_user.save
#      # Add Credit Card to Stripe
#
#
#        customer.sources.create(source: params[:stripeToken] )
#    else
#      customer = Stripe::Customer.retrieve(current_user.stripe_id)
#      customer.source = params[:stripeToken]
#      customer.save
#
#    end
#
#
#
#        flash[:notice]="Your card is saved."
#        redirect_to payment_method_path
#
#      rescue Stripe::CardError => e
#
#        flash[:alert]= e.message
#
#        redirect_to payment_method_path
#
# end
  private

  def connect_api
    @rave = RaveRuby.new(ENV['RAVE_PUBLIC_KEY'], ENV['RAVE_SECRET_KEY'], true)
  #  @rave = RaveRuby.new("FLWPUBK-c78cf32505df276ca75e3d5e3ab3f5ae-X","FLWSECK-fea1ff5bbf0640088b78ae475c975633-X")
    # This is the payload for sub account creation
    return @rave

  end

  def get_banks
    #url = URI("https://api.ravepay.co/v2/banks/KE?public_key=ENV['RAVE_PUBLIC_KEY']")
    url = URI("https://api.ravepay.co/v2/banks/KE?public_key=FLWPUBK_TEST-ecaad09b1ada35c07fd2c4dfc937f791-X")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["content-type"] = 'application/json'

    response = http.request(request)
    @banks=JSON.parse(response.body)
    puts response.read_body
  end

def get_subaccount
  @user= User.find(current_user.id)
  @subaccount=@user.subaccount

  return @subaccount
end

     def user_params
       params.require(:user).permit(:phone_number, :pin,:subaccount)
     end

end
