# frozen_string_literal: true

module CommonModule
  extend ActiveSupport::Concern
  def set_comments
    User.joins(:comments).preload(:comments).select('comments.*, users.name, users.email')
  end

  def collect_model_param
    commentable_type = request.path.split('/')[1].singularize.capitalize
    case commentable_type
    when 'Book'
      { id: params[:book_id], set_type: Book.find(params[:book_id]), path: book_path(params[:book_id]) }
    when 'Report'
      { id: params[:report_id], set_type: Report.find(params[:report_id]), path: report_path(params[:report_id]) }
    end
  end
end
