class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbreviation
      t.string :legal
      t.string :legal_description
      t.string :source

      t.timestamps
    end
  end
end
