# frozen_string_literal: true

class Admin::AssetsController < ApplicationController
  before_action :set_company
  before_action :set_asset, only: [:show, :edit, :update, :destroy]

  def index
    @assets = @company.assets.all
  end

  def show; end

  def new
    @asset = Asset.new
  end

  def create
    @asset = @company.assets.create(asset_params)

    if @asset.save
      redirect_to [:admin, @company, @asset]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @asset.update(asset_params)
      rediect_to [:admin, @company, @asset]
    else
      render :edit
    end
  end

  def destroy
    @assest.destroy
    rediect_to [:admin, @company, :assets]
  end

  private

    def asset_params
      params.require(:asset).permit(:type, :asset_number, :last_service_date, :last_obo_reading, :last_odo_read_date, :is_active, :company_id)
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_asset
      @asset = Asset.find(params[:id])
    end
end
