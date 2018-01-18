class CreateAudis < ActiveRecord::Migration
  def change
    create_table :audis do |t|
    	t.string :category
      t.integer :capacity
      t.references :movie, index: true, foreign_key: true
      t.references :theatre, index: true, foreign_key: true
    end
  end
end
