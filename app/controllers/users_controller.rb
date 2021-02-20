# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:email).page(params[:page]).per(5)
  end

  def show
    u = User.find_by(id: params[:id])
    if u.nil?
      # TO DO 本来は404ページを用意してリダイレクトの方が良さそう
      redirect_to '/users'
    else
      @user = User.find_by(id: params[:id])
    end
  end
end
