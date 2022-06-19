class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit( :name, :start, :finish, :allday, :updated_at, :memo))
    if @post.save
      flash[:notice]="スケジュールを新規登録しました"
      redirect_to :posts
    else
      flash[:notice]="スケジュールを新規登録出来ませんでした"
      render"new"
    end
    $numbers= Post.count
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit( :name, :start, :finish, :allday, :updated_at, :memo))
      flash[:notice]="スケジュールを更新しました"
      redirect_to :posts
    else
      flash[:notice]="スケジュールを更新出来ませんでした"
      render"edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice]
    redirect_to :posts
    $numbers= Post.count
  end

  $numbers= Post.count

  require 'date'
  $date = Date.today
  $year= $date.year
  $month= $date.month
  $day= $date.day
end
