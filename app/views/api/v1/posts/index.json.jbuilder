json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.description post.description
  json.featured_image_url post.featured_image_url
  json.url post.url
  json.blog_entity post.blog_entity.name
  json.created_at post.created_at
end
