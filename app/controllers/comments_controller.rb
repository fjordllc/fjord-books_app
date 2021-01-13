class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create]  
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: 'コメントを作成しました'
    else
      redirect_to @commentable, notice: 'コメントを入力してください'
    end
  end

  private

  def set_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_type, :commentable_id)
  end
end
