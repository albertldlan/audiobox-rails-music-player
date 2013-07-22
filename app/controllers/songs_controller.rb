class SongsController < ApplicationController

	# before_filter :authenticate_user!

  def index
  	@songs = Song.order("id desc").limit(10)
    if current_user
      @user_songs = current_user.songs.order("id desc").limit(10)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
  	@song = current_user.songs.new(params[:song])
  	if @song.save
      @songs = Song.order("id desc").limit(10)
      @user_songs = current_user.songs.order("id desc").limit(10)
    end
    
  end
end
