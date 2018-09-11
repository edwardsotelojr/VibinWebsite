# the pages controller contains all of the cod for any page inside of /pages
class PagesController < ApplicationController
# back-end code for pages/index
  def index

  end
# back-end code for pages/home
  def home
    @songs = Array.new
    following = Array.new
    following.push(current_user.id)
     for @f in current_user.following do
       following.push(@f.id)
     end
@posts = Post.where("user_id IN (?)", following)
@userpost = Post.all.where("user_id = ?", current_user.id)
 for @a in @userpost do
   if @a.audio_file_name != nil
      @songs.push(@a.audio_file_name)
   end
 end
@followers = Relationship.all.where("followed_id = ?", current_user.id)
@following = Relationship.all.where("follower_id = ?", current_user.id)
  @newpost = Post.new
  end

# back-end code for pages/profile
  def profile
    # grab the username from the URL as :id
    @user = User.find_by_username params[:id]
 @followers = Relationship.all.where("followed_id = ?", User.find_by_username(params["id"]).id)
 @following = Relationship.all.where("follower_id = ?", User.find_by_username(params["id"]).id)
 @posts = Post.all.where("user_id = ?", User.find_by_username(params["id"]).id)
end

def profileMusic

  if current_user
      @user = User.find_by_username params[:id]
      @followers = Relationship.all.where("followed_id = ?", User.find_by_username(params["id"]).id)
      @following = Relationship.all.where("follower_id = ?", User.find_by_username(params["id"]).id)
     @posts = Post.all.where("user_id = ?", User.find_by_username(params["id"]).id)
     @follow = Relationship.all.where("follower_id = ?", User.find_by_username(params["id"]).id)
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
        params.require(:post).permit(:user_id, :content, :audio, :pic)

    end
end
