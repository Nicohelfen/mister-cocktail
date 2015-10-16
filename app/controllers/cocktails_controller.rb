class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :destroy]

  def index
    @cocktails = Cocktail.all

  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    whitelist = params.require(:cocktail).permit(:name, :picture )
    @cocktail = Cocktail.new(whitelist)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)

    else
      render :new
    end
  end

  def destroy
  end



private
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
