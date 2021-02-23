class Ahoy::Event
  include Mongoid::Document

  # associations
  belongs_to :visit, index: true

  # fields
  field :name, type: String
  field :properties, type: Hash
  field :time, type: Time

  index({name: 1, time: 1})
end
