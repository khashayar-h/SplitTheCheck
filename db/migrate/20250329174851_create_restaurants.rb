class CreateRestaurants < ActiveRecord::Migration[8.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :will_split_votes
      t.integer :wont_split_votes

      t.timestamps
    end
  end
end
