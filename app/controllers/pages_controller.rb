# the pages controller contains all of the cod for any page inside of /pages
class PagesController < ApplicationController
# back-end code for pages/index
  def index
  end
# back-end code for pages/home
  def home
  @posts = Post.all
  end
# back-end code for pages/profile
  def profile
    # grab the username from the URL as :id
@posts = Post.all
end
# back-end code for pages/explore
  def explore
   @post = Post.new
   @post.user_id = "713"
   respond_to do |f|
   if (@post.save)

     flash[:alert] = "Success"
     f.html { redirect_to "", notice: "Post Created"}
   else
     f.html { redirect_to "" , notice: "error"}
 end
 end
   @toFollow = User.all.last(5)
  end
  def groupies
  end
  private
    def post_params
        params.require(:post).permit(:user_id, :content)
    end
end
