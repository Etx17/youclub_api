class ClubsController < ApplicationController
  before_action :set_zipcode, only: [:index]

  def index
      @pagy, @clubs = pagy_countless(Club.where(actual_zipcode: session[:zipcode]), items: 5)
      respond_to do |format|
        format.html
        format.turbo_stream
      end

  end

  def update_zipcode
    zipcode = params[:zipcode]
    if zipcode =~ /^\d{5}$/
      session[:zipcode] = zipcode
      redirect_to clubs_path
    else
      flash[:alert] = "Invalid zipcode format. Please enter a 5-digit zipcode."
      redirect_to clubs_path
    end
  end

  private

  def set_zipcode
    if params[:zipcode] # If the zipcode is provided as a parameter, use it
      session[:zipcode] = params[:zipcode]
    else
      if request.location && !request.location.data['bogon']
        session[:zipcode] = request.location.postal_code
      else
        session[:zipcode] ||= '75018'
      end
    end
  end
end
