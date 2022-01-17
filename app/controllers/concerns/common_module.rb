# frozen_string_literal: true

module CommonModule
  extend ActiveSupport::Concern
  def set_comments
    User.joins(:comments).preload(:comments).select('comments.*, users.name')
  end
end
