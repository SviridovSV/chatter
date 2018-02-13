class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    posts = Post.all
    @posts = RateCheckoutService.new(posts).remove_unpopular_posts
    @posts = Post.search(params[:total_rate])
  end

  def show
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def new
    @post = Post.new
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :posts, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, :total_rate)
  end
end
