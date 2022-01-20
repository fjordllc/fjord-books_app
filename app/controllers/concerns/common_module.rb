# frozen_string_literal: true

module CommonModule
  extend ActiveSupport::Concern
  def set_comments
    User.joins(:comments).preload(:comments).select('comments.*, users.name, users.email')
  end

  def set_book_or_report_id(type)
    if type == 'Book'
      params[:book_id]
    elsif type == 'Report'
      params[:report_id]
    end
  end

  def collect_model_param
    parameters = {}
    commentable_type = request.path.split('/')[1].singularize.capitalize
    path_data = {commentable_type: commentable_type, id: set_book_or_report_id(commentable_type)}
    parameters = if commentable_type == 'Book'
      {id: params[:book_id], set_type: Book.find(params[:book_id]), path: book_path(path_data)}
    elsif commentable_type == 'Report'
      {id: params[:report_id], set_type: Report.find(params[:report_id]), path: report_path(path_data)}
    end
  end
end
