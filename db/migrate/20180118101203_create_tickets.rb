class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
    	t.integer :number
      t.references :booking, index: true, foreign_key: true
    end
  end
end
