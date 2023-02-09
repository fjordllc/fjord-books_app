# frozen_string_literal: true

class BookCommentsController < CommentsController
  before_action :set_comment

  private

  def set_comment
    @comments = Book.find(params[:book_id])
  end
end
