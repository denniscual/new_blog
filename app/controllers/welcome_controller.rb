class WelcomeController < ApplicationController
  def index
    # get the posts data then limit it to only 3 post and order it to descending
    @posts = Post.all.limit(3).order('created_at desc')
  end
end
