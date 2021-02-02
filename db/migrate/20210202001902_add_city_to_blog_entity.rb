class AddCityToBlogEntity < ActiveRecord::Migration[6.1]
  def change
    add_reference :blog_entities, :city, null: false, foreign_key: true
  end
end
