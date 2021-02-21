module Api
  module V1
    class PostsController < ActionController::Base
      def index
        params.permit(:page)
        city = City.find(params[:city_id])
        @posts_response = city.posts.page(params[:page].to_i).per(10)
        render json: @posts_response
      end
    end
  end
end
