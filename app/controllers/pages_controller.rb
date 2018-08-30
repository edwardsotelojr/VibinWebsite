# the pages controller contains all of the cod for any page inside of /pages
class PagesController < ApplicationController
# back-end code for pages/index
  def index

  end
# back-end code for pages/home
  def home
@posts = Post.all.where("user_id = ?", current_user.id)
@followers = Relationship.all.where("followed_id = ?", current_user.id)
  @newpost = Post.new
  end
# back-end code for pages/profile
  def profile

    # grab the username from the URL as :id
    @user = User.find_by_username params[:id]
 @followers = Relationship.all.where("followed_id = ?", User.find_by_username(params["id"]).id)
@posts = Post.all.where("user_id = ?", current_user.id)
@follow = Relationship.all.where("follower_id = ?", User.find_by_username(params["id"]).id)
end
def profileMusic

  if current_user
      @currentuserfullname = current_user.full_name
      @currentusername = current_user.username
  end

end

# back-end code for pages/explore
  def explore
    @users = User.where("username LIKE ?", "")
 end


  def groupies
  end

  def search

      if params[:search]
        @users = User.find_by_username params[:search]

      else
        @users = User.all
      end
end


  private
    def user_params
      params.require(:user).permit(:id, :full_name, :email)
    end

    def post_params
        params.require(:post).permit(:user_id, :content)
    end
end
