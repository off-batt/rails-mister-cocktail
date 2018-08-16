class CocktailsController < ApplicationController

  # create
  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail_params = params.require(:cocktail).permit(:name)
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # read
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  # update
  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    cocktail_params = params.require(:cocktail).permit(:name)
    @cocktail.update(cocktail_params)
    redirect_to cocktails_path(@cocktail)
  end
  # delete
  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

end
