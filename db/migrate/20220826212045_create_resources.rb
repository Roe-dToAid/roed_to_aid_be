class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.references :state, foreign_key: true
      t.string :name
      t.string :website
      t.string :service
      t.boolean :active
      t.string :bipoc_focus

      t.timestamps
    end
  end
end
