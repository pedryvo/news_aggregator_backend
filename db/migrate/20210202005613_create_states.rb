class CreateStates < ActiveRecord::Migration[6.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :acronym
      t.integer :region_id
      t.timestamps
    end
  end
end
