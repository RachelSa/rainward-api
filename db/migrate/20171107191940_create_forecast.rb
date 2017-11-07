class CreateForecast < ActiveRecord::Migration[5.1]
  def change
    create_table :forecasts do |t|
      t.float :current_temp
      t.float :wind_speed
      t.integer :cloud_coverage
      t.integer :weather_code
      t.references :city
    end
  end
end
