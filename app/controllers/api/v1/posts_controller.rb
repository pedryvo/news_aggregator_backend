module Api
  module V1
    class PostsController < ActionController::Base
      def index
        city = City.find(params[:city_id])
        @posts = city.posts.last(5)
      end
    end
  end
end
