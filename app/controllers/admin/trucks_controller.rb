# frozen_string_literal: true

class Admin::TrucksController < ApplicationController
  before_action :set_company
  before_action :set_truck, except: [:index, :new, :create]
  def index
    @trucks = Truck.all
  end

  def show; end

  def new
    @truck = Truck.new
  end

  def create
    respond_to do |format|
      @truck = @company.trucks.create(truck_params)
      if @truck.save
        format.html  { redirect_to [:admin, @company, @truck] }
        format.js
      else
        format.html  { render :new }
      end
    end
  end

  def edit; end

  def update
    if @truck.update(truck_params)
      redirect_to [:admin, @company, @truck]
    else
      render :update
    end
  end

  def destroy
    @truck.destroy
    redirect_to [:admin, @company, :trucks]
  end

  def toggle_status
    @truck.toggle(:is_active).save!
  end

  private

    def truck_params
      params.require(:truck).permit(:vehicle_number, :last_service_date,
                                    :last_odometer_reading, :last_odometer_date,
                                    :is_active, :company_id)
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_truck
      @truck = Truck.find(params[:id])
    end
end
