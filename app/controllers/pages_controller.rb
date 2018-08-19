# the pages controller contains all of the cod for any page inside of /pages
class PagesController < ApplicationController
# back-end code for pages/index
  def index

  end
# back-end code for pages/home
  def home
@posts = Post.all.where("user_id = ?", current_user.id)
  @newpost = Post.new
  end
# back-end code for pages/profile
  def profile
    # grab the username from the URL as :id
@posts = Post.all.where("user_id = ?", current_user.id)
end
# back-end code for pages/explore
  def explore
    @users = User.where("username LIKE ?", "")
 end


  def groupies
  end

  def search
      @users = User.all
      if params[:search]
        @users = User.search(params[:search])
        
      else
        @users = User.all
      end
end


  private

    def post_params
        params.require(:post).permit(:user_id, :content)
    end
end
