class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿しました。"
      redirect_to :action => "index"
    else
      # redirect_to :action => "new"
      render("posts/new")
    end
  end
  def mypage
  end
  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    @posts = @user.posts
  end
  def index
    @users = User.all
  end
  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "削除しました。"
    redirect_to action: :index
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to :root
    else
      render action: :new
    end
  end
  def ensure_correct_user
    @post = Post.find(params[:id])
      if @post.user_id != current_user.id
        flash[:notice] = "権限がありません"
        redirect_to("/posts/new")
      end
  end
  private
  def post_params
    params.require(:post).permit(:need,:notneed)
  end
end
