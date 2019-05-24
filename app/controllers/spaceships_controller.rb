class SpaceshipsController < ApplicationController
  def index
    @spaceships = Spaceship.all
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(set_spaceship)
    @spaceship.user_id = current_user.id
    if @spaceship.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    @spaceship = Spaceship.find(params[:id])
    @spaceship.destroy
    redirect_to spaceship_path
  end

  private

  def set_spaceship
    params.require(:spaceship).permit(:name, :price, :photo)
  end
end
