class AddStatusToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :status, :boolean
  end
end
