class AddAppNameToCity < ActiveRecord::Migration[6.0]
  def change
    add_column :cities, :app_name, :string
  end
end
