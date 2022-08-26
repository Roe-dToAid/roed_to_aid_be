class CreateMisinformationCenters < ActiveRecord::Migration[5.2]
  def change
    create_table :misinformation_centers do |t|
      t.references :state, foreign_key: true
      t.string :name
      t.string :address
      t.string :source

      t.timestamps
    end
  end
end
