# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to user_path(@user), notice: t('controllers.relationships.notice_create')
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    redirect_to user_path(@user), notice: t('controllers.relationships.notice_destroy')
  end
end
