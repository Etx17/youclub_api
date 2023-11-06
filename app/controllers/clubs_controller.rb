class ClubsController < ApplicationController
  before_action :set_zipcode, only: [:index]
  before_action :set_category, only: [:index]
  before_action :set_subcategory, only: [:index]

  def index
    clubs = Club.where( actual_zipcode: session[:zipcode], category: session[:category])

    if session[:subcategory] != "Tous"
      clubs = clubs.where(subcategory: session[:subcategory])
    end

    @pagy, @clubs = pagy_countless(clubs, items: 5)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @club = Club.find(params[:id])
  end

  def update_category
    category = params[:category]
    session[:category] = category
    redirect_to clubs_path
  end

  def update_subcategory
    subcategory = params[:subcategory]["subcategory"]
    session[:subcategory] = subcategory
    redirect_to clubs_path
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

    if session[:zipcode].nil?
      p 'session[:zipcode] is nil so we do request user location zipcode'
      if request.location && !request.location.data['bogon']
        session[:zipcode] = request.location.postal_code
        session[:zipcode] == '75000' ? session[:zipcode] = '75018' : session[:zipcode]
      else
        p 'so we use or 75018'
        session[:zipcode] = '75018'
      end
    end


    if request.location && !request.location.data['bogon']
      session[:coords] = request.location.data["loc"] unless Rails.env.development?
    else
      session[:coords] = "48.8856124,2.3233836" # default location in 75017
    end
  end

  def set_category

    if params[:category] # If the category is provided as a parameter, use it
      session[:category] = params[:category]
    else
      session[:category] ||= 'Sports, activités de plein air'
    end
  end

  def set_subcategory
    if params[:subcategory] # If the subcategory is provided as a parameter, use it
      session[:subcategory] = params[:subcategory]
    else
      session[:subcategory] ||= 'Tous'
    end
  end

end
