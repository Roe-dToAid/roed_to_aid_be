class AddCityAndZipToMisinformationCenters < ActiveRecord::Migration[5.2]
  def change
    add_column :misinformation_centers, :city, :string
    add_column :misinformation_centers, :zip, :string
  end
end
