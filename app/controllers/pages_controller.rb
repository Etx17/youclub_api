class PagesController < ApplicationController
  before_action :authenticate_admin!, only: [:admin_dashboard]

  def home
  end

  def legal
  end

  def admin_dashboard
    if params[:actual_zipcode].present?
      @pagy, @clubs = pagy(Club.where(actual_zipcode: params[:actual_zipcode]), items: 20)
    else
      @pagy, @clubs = pagy(Club.all, items: 20)
    end
  end


  def dashboard
    @user = current_user
  end

  private

  def authenticate_admin!
    authenticate_user!  # Devise's method to ensure the user is logged in
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
