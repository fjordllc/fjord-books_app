# frozen_string_literal: true

require 'time'

class ReportsController < ApplicationController
  include CommonModule
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
    @report_comments = []
    set_comments.map do |comment|
      next unless comment.commentable_id == params[:id].to_i && comment.commentable_type == 'Report'

      @report_comments << { id: comment.id,
                            comment_content: comment.comment_content,
                            created_at: comment.created_at,
                            user_name: comment.name,
                            user_id: comment.user_id,
                            email: comment.email }
    end
    @comment = Comment.new
  end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human) }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human) }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
      format.json { head :no_content }
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :study_date, :report_content, :user_id)
  end
end
