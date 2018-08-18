class LayoutsController < ApplicationController
def nav_user

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

private
    def post_params # allow certain data to be passed via form
      params.require(:post).permit(:user_id, :content)
    end
end
