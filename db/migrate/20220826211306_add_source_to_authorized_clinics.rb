class AddSourceToAuthorizedClinics < ActiveRecord::Migration[5.2]
  def change
    add_column :authorized_clinics, :source, :string
  end
end
