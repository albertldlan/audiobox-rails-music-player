class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@user_songs = @user.songs
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end

end
