class PagesController < ApplicationController
  before_action :authenticate_admin!, only: [:admin_dashboard]


  def home
  end

  def legal
  end

  def admin_dashboard
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
