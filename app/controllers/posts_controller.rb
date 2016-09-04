class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  # give authentication to the user except on the index and show view
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # this will only display 2 posts per page...
    @posts = Post.all.order('created_at desc').paginate(page: params[:page], per_page: 5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: 'Successfully save your post'
    else
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update

    if @post.update post_params
      redirect_to @post, notice: 'Successfully update!'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end



end
