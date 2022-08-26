class CreateAuthorizedClinics < ActiveRecord::Migration[5.2]
  def change
    create_table :authorized_clinics do |t|
      t.references :state, foreign_key: true
      t.string :name
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :services
      t.string :website

      t.timestamps
    end
  end
end
