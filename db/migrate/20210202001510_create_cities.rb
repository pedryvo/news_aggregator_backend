class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.boolean :capital
      t.string :code
      t.integer :state_id
      t.timestamps
    end
  end
end
