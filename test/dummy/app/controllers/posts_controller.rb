# typed: true
class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    title[:post] = @post.name
  end
end
