# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    # 日報を削除する
    Report.where(poster_id: current_user.id).destroy_all
    # コメントを削除する
    Comment.where(poster_id: current_user.id).destroy_all

    User.find(current_user.id).destroy
    redirect_to users_path
  end

  protected

  # Override
  def update_resource(resource, params)
    if params[:password].blank?
      # パスワード変更を伴わない場合はオーバーライドする
      # current_passwordが残っていると、これを更新しようとしてエラーになるのでparamsから削除
      params.delete(:current_password)
      resource.update_without_password(params)
    else
      # パスワード変更を伴う場合はデフォルトの実装を使う
      super
    end
  end
end
