class SpaceshipsController < ApplicationController
  def show
    @spaceship = Spaceship.find(params[:id])
  end

  private

  def cocktail_params
    params.require(:spaceship).permit(:name, :photo, :price)
  end
end
