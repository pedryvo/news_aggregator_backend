class BlogEntity < ApplicationRecord
  belongs_to :city
  has_many :posts

  def fetch_news
    rss = RestClient.get self.base_url
    
    feed = SimpleRSS.parse rss
    
    feed.items.each do |item|
      fetch_post = LinkThumbnailer.generate(item.link.include?('?') ?  item.link[/[^?]+/] : item.link)
      post_title = fetch_post.title
      post_url = fetch_post.url.to_s
      post_featured_image = fetch_post.images.first.src
      post_description = fetch_post.description + '...'

      Post.create!(title: post_title, featured_image_url: post_featured_image, url: post_url, description: post_description, blog_entity: self) unless Post.exists?(title: post_title)
    end
  end
end
