class RentalsController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @rental = Rental.new
    @taken_dates = @spaceship.rentals
                             .map { |rental| (rental.start_date..rental.end_date).map {
                                 |date| date.strftime("%F") }
                             }
                             .flatten
                             .uniq
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @rental = Rental.new(rental_params)
    @rental.user_id = current_user.id
    @rental.spaceship = @spaceship
    # @rental.accepted = false
    if @rental.save
      redirect_to dashboard_path
    else
      render "new"
    end
  end

  def accept
    @rental = Rental.find(params[:rental_id])
    @rental.accepted = true
    @rental.save
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def decline
    @rental = Rental.find(params[:rental_id])
    @rental.accepted = false
    @rental.save
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :spaceship_id, :user_id)
  end
end
