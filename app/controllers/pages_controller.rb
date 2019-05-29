class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @pending_rentals = current_user.rental_requests.where(accepted: nil)
    @accepted_rentals = current_user.rental_requests.where(accepted: true)
    @declined_rentals = current_user.rental_requests.where(accepted: false)
  end
end
