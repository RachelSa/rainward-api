class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.integer :api_id
      t.integer :rating
      t.string :name
      t.string :country
      t.float :lat
      t.float :lon
      t.string :region
      t.string :photo_url, default: "https://c1.staticflickr.com/7/6101/6347529989_fba4717061_q.jpg"
      t.string :current_description
      t.float :current_temp
      t.references :suggestion
    end
  end
end
