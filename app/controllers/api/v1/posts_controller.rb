ApiPagination.configure do |config|
  config.paginator = :pagy
end

include Pagy::Backend
include Rails::Pagination

module Api
  module V1
    class PostsController < ActionController::Base
      def index
        city = City.find(params[:city_id])
        @posts = city.posts #.reverse_order

        paginate json: @posts, per_page: 10
      end
    end
  end
end
