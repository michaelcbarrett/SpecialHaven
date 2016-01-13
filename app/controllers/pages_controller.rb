class PagesController < ApplicationController
  def home
  end

  def timeline
  	@posts = Post.all
  	@users = User.all
  end
end
