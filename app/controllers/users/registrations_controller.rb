# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # OAuthを使わない場合でも、uidが埋まるようにする
  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    super # 親クラスのbuild_resourceメソッドを呼び出し
  end

  protected

  def update_resource(resource, params)
    # passwordに値が格納されていたら、親クラスのメソッドを実行し、その戻り値を返す
    return super if params['password'].present?

    # パスワードなしでアカウントの更新を出来るようにする
    resource.update_without_password(params.except('current_password'))
  end
end
