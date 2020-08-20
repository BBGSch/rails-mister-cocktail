class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(@dose.cocktail_id)
  end
  
  def update
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(@dose.cocktail_id)

    @dose.update(dose_params)
    # raise
    redirect_to cocktail_path(@cocktail)
  end
  

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(@dose.cocktail_id)
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private  

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end


end
