class ClubsController < ApplicationController
  before_action :set_zipcode, only: [:index]
  before_action :set_category, only: [:index]
  before_action :set_subcategories, only: [:index]

  def index
    clubs = Club.where( actual_zipcode: session[:zipcode], category: session[:category])
    if session[:subcategories] != "Tous"
      clubs = clubs.where("? = ANY(subcategories)", session[:subcategories])
    end

    clubs = clubs.order(score: :desc)

    @pagy, @clubs = pagy_countless(clubs, items: 6)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @club = Club.find(params[:id])
  end

  def edit
    @club = Club.find(params[:id])
  end

  def update
    @club = Club.find(params[:id])
    if @club.update(club_params)
      redirect_to edit_club_path(@club), notice: 'Club was successfully updated.'
    else
      render :edit
    end
  end

  def update_category
    category = params[:category]
    session[:category] = category
    redirect_to clubs_path
  end

  def update_subcategories
    subcategories = params[:subcategories]["subcategories"]
    session[:subcategories] = subcategories
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

  def mark_as_called
    club = Club.find(params[:id])
    club.update(called: !club.called)
    redirect_to admin_dashboard_path, notice: "Club status updated."
  end

  def update_comment
    club = Club.find(params[:id])
    if club.update(club_params)
      redirect_to admin_dashboard_path, notice: 'Note updated successfully.'
    else
      redirect_to admin_dashboard_path, alert: 'Unable to update note.'
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

  def set_subcategories
    if params[:subcategories] # If the subcategories is provided as a parameter, use it
      session[:subcategories] = params[:subcategories]
    else
      session[:subcategories] ||= 'Tous'
    end
  end

  def remove_image
    @club = Club.find(params[:id])
    if @club.photos.attached?
      @club.photos.first.purge
      redirect_to edit_club_path(@club), notice: 'Image was successfully removed.'
    else
      redirect_to edit_club_path(@club), alert: 'No image to remove.'
    end
  end

  def fetch_google_reviews(place_id)
    # Construct the API URL
    url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{place_id}&fields=name,rating,reviews&key=#{ENV['GOOGLE_API_KEY']}"

    # Make the HTTP request and parse the response
    response = HTTParty.get(url)
    return JSON.parse(response.body) if response.success?
  end

  def club_params
    params.require(:club).permit(
      :name, :rna_number, :geo_point, :category, :address, :actual_zipcode,
      :subcategories, :nearbyStation, :website, :objet, :category_number,
      :subcategories_number, :structure_type, :phone_number, :adherence_fee,
      :inscription_open_all_year, :inscription_start_date, :inscription_end_date,
      :comment,
      :logo,
      :status, :photos # Permit the images array
    )
  end
end
