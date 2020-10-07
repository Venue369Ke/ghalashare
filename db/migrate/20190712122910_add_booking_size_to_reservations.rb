class AddBookingSizeToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :booking_size, :integer
  end
end
