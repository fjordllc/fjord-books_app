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

  def collect_model_param(commentable_type)
    parameters = {}
    parameters << if commentable_type == 'Book'
      {params[:book_id]}
    elsif commentable_type == 'Report'
      {params[:report_id]}
    end
  end
end
