# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:show]
  def index
    @users = User.all
  end

  def show; end

  private

    def get_user
      @user = User.includes(:reports, :company).find(params[:id])
    end
end
