# frozen_string_literal: true

class Api::V1::ReportsController < ApplicationController
  before_action :get_user
  
  def index
#     @reports = @user.reports
    @reports = Report.includes(:asset_checks).where(user: @user)
  end

  def show
    @report = Report.find(params[:id])
  end

  def create
    @report = @user.reports.create(report_params)
    if @report.save
      render status: 201, json: { message: "Report created successfully." }
    else
      render status: 422, json: { message: "Failed to create report.", errors: @report.errors.full_messages }
    end
  end

  private

    def report_params
      params.require(:report).permit(:record_number, :is_complete, :street, :city, :state, :zipcode, :completion_date, :company_id, :user_id, asset_checks_attributes: [:asset_id, :report_id, :odometer_reading, :has_defects, :remarks, defect_ids: []])
    end

    def get_user
      @user = User.find(params[:user_id])
    end
end
