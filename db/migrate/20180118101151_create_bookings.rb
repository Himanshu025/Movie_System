class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
    	t.string :seats_no
      t.string :payment_method
      t.references :user, index: true, foreign_key: true
      t.references :show_time, index: true, foreign_key: true
    end
  end
end
