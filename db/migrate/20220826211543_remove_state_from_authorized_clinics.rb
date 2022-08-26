class RemoveStateFromAuthorizedClinics < ActiveRecord::Migration[5.2]
  def change
    remove_column :authorized_clinics, :state, :string
  end
end
