class AddPhotoUrlsToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :photo_url, :string, default: "https://c1.staticflickr.com/7/6101/6347529989_fba4717061_q.jpg"
  end
end
