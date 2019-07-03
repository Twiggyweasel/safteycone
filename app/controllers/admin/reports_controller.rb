# frozen_string_literal: true

# Controller for Reports in the Admin Namespace
class Admin::ReportsController < ApplicationController
  before_action :set_company
  before_action :set_report, only: %i[show edit update destroy success]
  def index
    @reports = @company.reports.includes(:user)
  end

  def show; end

  def new
    @report = Report.new
    @report.asset_checks.build
  end

  def create
    @report = Report.create(report_params)
    if @report.save
      redirect_to [:success, :admin, @company, @report]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @report.update(report_params)
      redirect_to [:admin, @company, :reports]
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to [:admin, @company, :reports]
  end

  def success; end

  private

    def report_params
      params.require(:report).permit(:record_number, :is_complete, :street, :city, :state, :zipcode,
                                     :completion_date, :company_id, :user_id,
                                     asset_checks_attributes: [:asset_id, :report_id, :odometer_reading, :has_defects, :remarks, defect_ids: []])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_report
      @report = Report.includes(:user).find(params[:id])
    end
end
