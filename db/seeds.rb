# Populate cities
CitiesPopulateService::Main.new.populate unless State.exists?(acronym: 'BA')

AdminUser.create!(email: 'admin@admin.com', password: '123456', password_confirmation: '123456', city_id: 615) if Rails.env.development?

# Blogs list
=begin 
blogs = [
  { name: 'Blog do Anderson', base_url: 'https://www.blogdoanderson.com/feed/' },
  { name: 'Blog do Rodrigo Ferraz', base_url: 'http://www.blogdorodrigoferraz.com.br/feed/' },
]

blogs.each { |blog| BlogEntity.create(name: blog[:name], base_url: blog[:base_url]) }
=end