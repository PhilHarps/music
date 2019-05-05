class ListingsController < ApplicationController

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def show
  end

  def index
  end
  private
  def post_params
    params.require(:post).permit(:name, :description, :condition, :type, :price, :year, :user_id)
  end
end