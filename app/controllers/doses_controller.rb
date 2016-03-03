class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(params.require(:dose).permit(:description, :ingredient_id))
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail

    @dose.destroy
    redirect_to cocktail
  end

private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
