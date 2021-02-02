class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  private

  def query_params
    params.require(:post).permit(:city_id)
  end
end
