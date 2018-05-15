class UpdatePhotoDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_default :cities, :photo_cred, "Horia Varlan"
    change_column_default :cities, :photo_url, "https://c1.staticflickr.com/5/4048/4303835161_519bd7553e_n.jpg"
  end
end
