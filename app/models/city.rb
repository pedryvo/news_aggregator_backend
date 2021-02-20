class City < ApplicationRecord
  belongs_to :state
  has_many :blog_entities
  
  def posts
    
  end
end
