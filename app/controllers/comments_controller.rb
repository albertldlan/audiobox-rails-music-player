class CommentsController < ApplicationController

  def create
  	@comment = current_user.comments.create(params[:comment])
  	@comments = Song.find(params[:song_id]).comments
  	@song = Song.find(params[:song_id])
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

  def index
  	@song = Song.find(params[:song_id])
  	@comments = @song.comments
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

end
