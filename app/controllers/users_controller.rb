# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_company
  before_action :set_user, except: [:index, :new, :create]

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
      redirect_to [@company, @user]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to [@company, @user]
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to @company
  end

  private

    def user_params
      params.require(:user).premit()
    end

    def set_company
      @company = Company.includes(:users).find(params[:company_id])
    end

    def set_user
      @user = User.find(params[:id])
    end
end
