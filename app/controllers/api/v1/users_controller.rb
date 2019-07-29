# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:show]

  def show; end

  def available_assets
    @user = User.find(params[:id])
    @assets = @user.company.assets.active
  end
  
  private

    def get_user
      @user = User.includes(:reports, :company).find(params[:id])
    end
end
