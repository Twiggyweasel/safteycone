class Admin::DefectsController < ApplicationController
  before_action :set_defect, only: [:show, :edit, :update, :destroy]
  
  def index
    @defects = Defect.all
  end
  
  def show; end
  
  def new
    @defect = Defect.new
  end
  
  def create
    @defect = Defect.create(defect_params)
    if @defect.save
      redirect_to [:admin, @defect], flash: { success: "Defect successfully created!" }
    else
      render :new
    end
  end
  
  def edit; end
  
  def update
    if @defect.update(defect_params)
      redirect_to [:admin, @defect], flash: { success: "Defect successfully Updated!" }
    else
      render :edit
    end
  end
  
  def destroy
    @defect.destroy
    redirect_to [:admin, :defects], flash: { danger: "Defect was successfully destroyed." }
  end
  
  private
  
    def defect_params
      params.require(:defect).permit(:name, :is_truck_defect, :is_trailer_defect, :is_active)
    end
  
    def set_defect
      @defect = Defect.find(params[:id])
    end
end