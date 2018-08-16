class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    dose_params = params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  # read
  def index
    @dose = dose.all
  end

  def show
  end

  # update
  def edit
  end

  def update
  end
  # delete
  def destroy
    @dose = Dose.find(params[:id])
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end
end
