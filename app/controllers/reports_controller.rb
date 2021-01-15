# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[edit update destroy]
  before_action :set_commentable, only: :show

  def index
    @reports = Report.all
  end

  def show
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @report = Report.new
  end

  def edit
    # 投稿者がログインユーザーでない場合はindexへリダイレクト
    return if @report.poster_id == current_user.id

    redirect_to reports_path
  end

  def create
    @report = Report.new(report_params)
    # 投稿したUserのidを取得
    @report.poster_id = current_user.id

    if @report.save
      redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_commentable
    @commentable = Report.find(params[:id])
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content, :poster_id)
  end
end
