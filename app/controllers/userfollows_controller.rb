# frozen_string_literal: true

class UserfollowsController < ApplicationController
  def create
    @user = User.find(params[:userfollow][:following_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Userfollow.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to @user
  end
end
