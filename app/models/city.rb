class City < ApplicationRecord
  belongs_to :state
  has_many :blog_entities
  has_many :posts, through: :blog_entities
end
