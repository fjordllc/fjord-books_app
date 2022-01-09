class ReportsController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
      else
      end
    end
  end

  private
  
  def set_report
    @report = Report.find(params[:id])
  end
end
