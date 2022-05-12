# frozen_string_literal: true

module ReportsHelper
  def allowed_user?(user)
    current_user == user
  end
end
