class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :city_id, type: Integer
  field :blog_entity_id, type: Integer
  field :title, type: String
  field :featured_image_url, type: String
  field :url, type: String
  field :description, type: String

  def blog_entity
    BlogEntity.find(self.blog_entity_id)
  end

  def city
    City.find(self.city_id)
  end

  def self.today
    map = %Q{
      function() {
        emit(this.course_id, {count: 1})
      }
    }
  
    reduce = %Q{
      function(key, values) {
        var result = {count: 0};
        values.forEach(function(value) {
          result.count += value.count;
        });
        return result;
      }
    }
  
    self.where(:created_at.gt => Date.today, status: "played").
      map_reduce(map, reduce).out(inline: true)
  end
end
