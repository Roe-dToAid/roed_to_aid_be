class AddAddressToAuthorizedClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :authorized_clinics, :address, :string
  end
end
