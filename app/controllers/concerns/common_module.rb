module CommonModule
  extend ActiveSupport::Concern
  def set_comments_users
    User.preload(:comments, :books)
  end
end
