# the pages controller contains all of the cod for any page inside of /pages
class PagesController < ApplicationController
# back-end code for pages/index
  def index
  end
# back-end code for pages/home
  def home
    following = Array.new
    for @f in current_user.following do
      following.push(@f.id)
    end
    @posts = Post.where("user_id = ?", following)
    @newPost = Post.new
      @toFollow = User.all.first(5)
  end
# back-end code for pages/profile
  def profile
    # grab the username from the URL as :id
if (User.find_by_username(params[:id]))
    @username = params[:id]
  else
    #redirect to 404 (root for now)
    redirect_to root_path, :notice=> "User not found"
  end
  @newPost = Post.new
  @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
  @toFollow = User.all.first(5)
end
# back-end code for pages/explore
  def explore
   @posts = Post.all
   @newPost = Post.new
   @toFollow = User.all.last(5)
  end
end
