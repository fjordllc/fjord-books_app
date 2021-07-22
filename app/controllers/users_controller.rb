# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = 'Following'
    @user  = User.find(params[:id])
    @users = @user.following
    # @users = @user.following.paginate(page: params[:page])
    render 'users/show_follow'
  end

  def followers
    @title = 'Followers'
    @user  = User.find(params[:id])
    # @users = @user.followers.paginate(page: params[:page])
    @users = @user.followers
    render 'users/show_follow'
  end
end
