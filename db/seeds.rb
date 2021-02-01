# Blog do Anderson
blogs = [
  { name: 'Blog do Anderson', base_url: 'https://www.blogdoanderson.com/feed/' },
  { name: 'Blog do Rodrigo Ferraz', base_url: 'http://www.blogdorodrigoferraz.com.br/feed/' }
]

blogs.each { |blog| BlogEntity.create(name: blog[:name], base_url: blog[:base_url]) }
