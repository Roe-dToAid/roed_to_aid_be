class ChangeLegalToIntegerInStates < ActiveRecord::Migration[5.2]
  change_table :states do |table|
    table.change :legal, 'integer USING CAST(legal AS integer)'
  end
end
