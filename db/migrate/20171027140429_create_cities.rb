class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.integer :api_id
      t.integer :rating
      t.string :name
      t.string :country
      t.float :lat
      t.float :lon
    end
  end
end
