# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_report
  def create
    comment = @report.comments.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      redirect_to @report, notice: t('comments.success')
    else
      redirect_to @report, notice: t('comments.failure')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_report
    @report = Report.find(params[:report_id])
  end
end
