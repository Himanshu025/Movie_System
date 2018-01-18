class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :title
      t.integer :year
      t.string :duration
      t.string :cast
    end
  end
end
