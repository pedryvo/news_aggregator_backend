# Populate cities
CitiesPopulateService::Main.new.populate unless State.exists?(acronym: 'BA')

AdminUser.create!(email: 'admin@admin.com', password: '123456', password_confirmation: '123456', city_id: 615) if Rails.env.development?
