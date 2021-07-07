# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc, id: :desc).page(params[:page]).per(10)
  end

  def show
    @user = current_user
  end
end
