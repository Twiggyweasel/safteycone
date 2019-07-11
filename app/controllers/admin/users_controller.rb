# frozen_string_literal: true

# controller for Users in the Admin Namespace
class Admin::UsersController < ApplicationController
  before_action :set_company
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = @company.users
  end

  def show; end

  def new
    @user = @company.users.new
  end

  def create
    @user = @company.users.create(user_params)
    if @user.save
      redirect_to [:admin, @company, :users], flash: { success: "User Successfully Created!" }
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to [:admin, @company, :users]
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to [:admin, @company, :users]
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :account_type, :company_id, :employee_number, :is_active, :password, :contact_number, :email)
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_user
      @user = User.find(params[:id])
    end
end
