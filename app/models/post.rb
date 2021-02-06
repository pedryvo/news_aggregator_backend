class Post < ApplicationRecord
  belongs_to :blog_entity

  delegate :company, to: :employee, allow_nil: true

  attribute :city

  def city
    self.blog_entity.city
  end
end
