class PostsController < ApplicationController
  def index
    city = City.find(query_params[:city_id])
    @posts = city.posts
  end

  private

  def query_params
    params.permit(:city_id)
  end
end
