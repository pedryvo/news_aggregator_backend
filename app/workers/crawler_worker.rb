class CrawlerWorker
  include Sidekiq::Worker

  def perform
    BlogEntity.all.each { |entity| entity.fetch_news }
  end
end

Sidekiq::Cron::Job.create(name: 'News Crawler Worker - every 10min', cron: '*/10 * * * *', class: 'CrawlerWorker')
