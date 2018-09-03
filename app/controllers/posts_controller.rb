class PostsController < ApplicationController

def new
  @posts = Post.new
end
def index
  @posts = Post.all
end

def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id
  respond_to do |f|
  if @post.save

    flash[:alert] = "Success"
    f.html { redirect_to "", notice: "Post Created"}
  else
    f.html { redirect_to "" , notice: "error"}
end
end
end

def show
  @post = Post.find(params[:id])
end
private
    def post_params # allow certain data to be passed via form
      params.require(:post).permit(:user_id, :content, :audio)
    end
end
