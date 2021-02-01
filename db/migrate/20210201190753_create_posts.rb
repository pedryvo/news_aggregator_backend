class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :featured_image_url
      t.string :url
      t.references :BlogEntity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
