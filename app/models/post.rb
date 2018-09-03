class Post < ApplicationRecord
belongs_to :user
validates :user_id, presence: true
validates :content, presence: true, length: { maximum: 140} # tweets are capped at 140 chars
has_attached_file :audio
  validates_attachment_content_type :audio, :content_type => ['audio/mpeg', 'audio/mp3']
default_scope -> {order(created_at: :desc)} # newest posts
end
