# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = t('controllers.common.following')
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'follow'
  end

  def followers
    @title = t('controllers.common.followers')
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'follow'
  end
end
