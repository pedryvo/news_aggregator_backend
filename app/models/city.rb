class City < ApplicationRecord
  belongs_to :state
  has_many :blog_entities
  
  def posts
    Post.where(city_id: self.id).order_by(created_at: :desc)
  end
end
