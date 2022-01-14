module CommonModule
  extend ActiveSupport::Concern
  class UsersComments
    def set_comments(params)
      Book.find(params[:id]).comments
    end

    def set_comments_users(comment_user_id)
      User.find_by(id: comment_user_id).name
    end
  end
end
