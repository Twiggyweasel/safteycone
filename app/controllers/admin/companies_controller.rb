# frozen_string_literal: true

# Controller for Companies in the Admin Namespace
class Admin::CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy toggle_company_status toggle_app_access toggle_admin_access]
  def index
    @companies = Company.all
  end

  def show
    @reports = @company.reports.includes(:user).order(created_at: "desc").limit(5)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      redirect_to [:admin, @company], flash: { success: "Company successfully created!" }
    else
      render :new
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to [:admin, @company], flash: { success: "Company successfully updated!" }
    else
      render :edit
    end
  end

  def destroy
    @company.delete
    redirect_to %i[admin companies], flash: { success: "Company successfully deleted" }
  end

  def toggle_company_status
    @company.toggle(:is_active)
    unless @company.is_active
      @company.update_columns(has_app_access: false, has_admin_access: false)
    end
    @company.save!
  end

  def toggle_app_access
    @company.toggle(:has_app_access).save! if @company.is_active
  end

  def toggle_admin_access
    @company.toggle(:has_admin_access).save! if @company.is_active
  end

  private

    def company_params
      params.require(:company).permit(:name, :provision_key, :user_cap)
    end

    def set_company
      @company = Company.includes(:employees, :company_admins).find(params[:id])
    end
end
