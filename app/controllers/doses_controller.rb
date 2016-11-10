class DosesController < ApplicationController
  before_action :find_dose, only: [:show, :update, :destroy, :edit]
  before_action :find_cocktail, only: [:new, :create]
  def index
    @doses = Dose.all
    @doses = @cocktail.doses.all
  end

  def show
  end

  def new
    @dose = Dose.new
    @dose = @cocktail.doses.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
