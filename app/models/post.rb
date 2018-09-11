class Post < ApplicationRecord
belongs_to :user
validates :user_id, presence: true
validates :content, presence: true, length: { maximum: 140} # tweets are capped at 140 chars

has_attached_file :pic, :styles => { :medium => "300x300", :thumb => "100x100" },  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/

has_attached_file :audio
  validates_attachment_content_type :audio, :content_type => ['audio/mpeg', 'audio/mp3']


default_scope -> {order(created_at: :desc)} # newest posts
end
