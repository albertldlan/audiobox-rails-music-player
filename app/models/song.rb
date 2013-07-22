class Song < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :title, :direct_upload_url, :songs_url

  before_create :default_title

  validates :user_id, presence:true

  has_many :comments

  def default_title
    self.title ||= File.basename(direct_upload_url, '.*').titleize if direct_upload_url
  end
end
