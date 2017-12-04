class AddPhotoCredToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :photo_cred, :string, default: "unknown"
  end
end
