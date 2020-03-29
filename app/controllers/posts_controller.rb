# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :members_only
  before_action :set_post, only: %i[show edit update destroy]
  before_action :all_posts, only: %i[index create update destroy]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @comments = if params[:comment]
        @post.comments.where(id: params[:comment])
      else
        @post.comments.where(parent_id: nil)
      end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
      PostMailer.post_created(@post).deliver_later
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice: 'Post successfully destroyed.'
  end

  private

  def all_posts
    @posts = Post.all
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :post_picture, photos: [])
  end

  def members_only
    unless current_user.has_role?(:member)
      redirect_to root_path, alert: "You must be a member of St. Paul's to
      use this function."
    end
  end
end
