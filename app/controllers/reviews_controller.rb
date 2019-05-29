class ReviewsController < ApplicationController
  def create
    @review = Review.new(reviews_params)
    @spaceship = Spaceship.find(params[:spaceship_id])
    @review.spaceship = @spaceship
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to spaceship_path(@spaceship) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'spaceships/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:rating, :content)
  end
end
