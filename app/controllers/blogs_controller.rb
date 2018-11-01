class BlogsController < ApplicationController
  # before_action :move_to_index, except: index

  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(8).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    # binding.pry
    Blog.create(text: blog_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  def edit
    @blog = Blog.find(params[:id])
  end


  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
      redirect_to action: :index
      # binding.pry
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:text).merge(user_id: current_user.id)
  end

  # def move_to_index
  #    redirect_to action: :index unless user_signed_in?
  # end
end
