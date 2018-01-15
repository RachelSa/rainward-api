class UpdateCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :precipitation_rating, :integer, default: 0
    add_column :cities, :temperature_rating, :integer, default: 0
    add_column :cities, :cloudiness_rating, :integer, default: 0
    add_column :cities, :windiness_rating, :integer, default: 0
  end
end
