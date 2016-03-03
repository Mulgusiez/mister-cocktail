class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params.require(:cocktail).permit(:name))
    if @cocktail.save
      redirect_to @cocktail
    else
      redirect_to :new
    end
  end
  def destroy
    @cocktail = Restaurant.destroy
    redirect_to :index
  end

private

  def find_cocktail
    @cocktail = Restaurant.find(params[:id])
  end
end