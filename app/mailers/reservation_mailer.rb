class ReservationMailer < ApplicationMailer
  def send_email_to_guest(guest, warehouse)
    @recipient = guest
    @warehouse = warehouse
    mail(to: @recipient.email, subject: "Enjoy your storage experience! 😉 ")
  end


  def send_email_to_admin(admin, new_user)
    @recipient = admin
    @new_user = new_user
    mail(to: 'denswam@gmail.com', subject: "New User Sign up! 😉 ")

end
end
