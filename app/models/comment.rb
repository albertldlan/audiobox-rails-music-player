class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  attr_accessible :comment, :time, :user_id, :song_id
end
