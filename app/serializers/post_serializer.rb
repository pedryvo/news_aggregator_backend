class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :featured_image_url, :url, :blog_entity, :city, :created_at
end
