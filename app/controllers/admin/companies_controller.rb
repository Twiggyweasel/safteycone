class Admin::CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  def index
    @companies = Company.all
  end

  def show; end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      redirect_to([:admin, @company])
    else
      render :new
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to([:admin, @company])
    else
      render :edit
    end
  end

  def destroy
    @company.delete
    redirect_to([:admin, :companies])
  end
  
  private 
    def company_params
      params.require(:company).permit(:name, :provision_key, :user_cap)
    end
    
    def set_company
      @company = Company.includes(:employees, :company_admins).find(params[:id])
    end
end
