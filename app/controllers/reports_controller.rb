# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_company
  def index
    @reports = @company.reports.includes([:user, :asset_checks]).all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    
    def set_company
      @company = Company.find(params[:company_id])  
    end
end
