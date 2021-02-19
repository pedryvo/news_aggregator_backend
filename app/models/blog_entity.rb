class BlogEntity < ApplicationRecord
  belongs_to :city

  def posts
    Post.where(blog_entity_id: self.id).order_by({created_at: -1})
  end

  def there_is_a_post_with_url(url)
    Post.where(url: url).exists?
  end

  def fetch_news
    
    begin
      rss = RestClient.get self.base_url
      feed = SimpleRSS.parse rss

      feed.items.each do |item|
        item_link = item.link.include?('?') ?  item.link[/[^?]+/] : item.link

        unless there_is_a_post_with_url(item_link)
          fetch_post = LinkThumbnailer.generate(item_link)
          post_title = fetch_post.title
          post_url = fetch_post.url.to_s
          post_featured_image = fetch_post.images.first.src
          post_description = fetch_post.description + '...'

          Post.create!(title: post_title, featured_image_url: post_featured_image, url: post_url, description: post_description, blog_entity: self) unless Post.exists?(title: post_title)
        end
      end
    rescue => e
      puts "Rescued: #{e.inspect}"
    end
  end
end
