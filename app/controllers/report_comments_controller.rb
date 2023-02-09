# frozen_string_literal: true

class ReportCommentsController < CommentsController
  before_action :set_comment

  private

  def set_comment
    @comments = Report.find(params[:report_id])
  end
end
