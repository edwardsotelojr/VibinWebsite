class Post < ApplicationRecord
belongs_to :user
validates :user_id, presence: true
validates :content, presence: true, length: { maximum: 140} # tweets are capped at 140 chars
mount_uploader :audio, AudioUploader
mount_uploader :photo, PhotoUploader

 validates_integrity_of  :photo
 validates_processing_of :photo

default_scope -> {order(created_at: :desc)} # newest posts
end
