class Post < ApplicationRecord
  belongs_to :blog_entity

  delegate :company, to: :employee, allow_nil: true
end
