# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    @following = @user.following.page(params[:page])
  end
end
