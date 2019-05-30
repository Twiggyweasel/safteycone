# frozen_string_literal: true

class Api::V1::ReportsController < ApplicationController
  before_action :get_user, only: %i[show]
  before_action :get_report, only: %i[show]
  def index
  end

  def show; end

  def new
  end

  def create
  end

  private

    def get_user
      @user = User.find(params[:user_id])
    end

    def get_report
      @report = Report.find(params[:id])
    end
end
