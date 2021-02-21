namespace :crawler do
  desc "TODO"
  task fetch_news: :environment do
    BlogEntity.all.each { |entity| entity.delay.fetch_news }
  end

end
