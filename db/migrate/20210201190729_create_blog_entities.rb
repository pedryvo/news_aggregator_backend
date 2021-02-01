class CreateBlogEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_entities do |t|
      t.string :name
      t.string :base_url

      t.timestamps
    end
  end
end
