class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :blog_entity_id, type: Integer
  field :title, type: String
  field :featured_image_url, type: String
  field :url, type: String
  field :description, type: String

  def blog_entity
    BlogEntity.find(self.blog_entity_id)
  end
end
