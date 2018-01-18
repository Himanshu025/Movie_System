class CreateShowTimes < ActiveRecord::Migration
  def change
    create_table :show_times do |t|
    	t.string :start_time
      t.string :end_time
      t.references :audi, index: true, foreign_key: true
    end
  end
end
