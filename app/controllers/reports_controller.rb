class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: %i[ show edit update destroy ]

  def index
    if current_user.admin?
      @categories = Report.select(:category).distinct.pluck(:category).compact.reject(&:blank?)
      @reports = Report.all
    else
      @categories = current_user.reports.select(:category).distinct.pluck(:category).compact.reject(&:blank?)
      @reports = current_user.reports
    end
  
    if params[:category].present? && params[:category] != "All Categories"
      @reports = @reports.where("category ILIKE ?", "%#{params[:category]}%")
    end
  
    @reports = @reports.where(status: params[:status]) if params[:status].present?
  
    @reports = @reports.order(created_at: :desc).page(params[:page])
  end
  
  
  
  

  def show
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      PublishReportJob.perform_later(@report.id) if @report.published?
      redirect_to reports_path, notice: 'Report created.'
    else
      render :new
    end
  end


  def update
    if @report.update(report_params)
      PublishReportJob.perform_later(@report.id) if @report.published?
      redirect_to reports_path, notice: 'Report updated.'
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path, notice: 'Report deleted.'
  end

  private

    def set_report
      @report = current_user.admin? ? Report.find(params[:id]) : current_user.reports.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:title, :description, :category, :status, :published_on, :user_id, :logo)
    end
end
