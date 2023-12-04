class PagesController < ApplicationController
  before_action :authenticate_admin!, only: [:admin_dashboard]
  before_action :set_breadcrumb

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

  def set_breadcrumb
    add_breadcrumb 'Accueil', :root_path
    add_breadcrumb 'Mentions légales', :legal_path if action_name == 'legal'
    add_breadcrumb 'Panneau administrateur', :admin_dashboard_path if action_name == 'admin_dashboard'
    add_breadcrumb 'Tableau de bord', :pages_dashboard_path if action_name == 'dashboard'
  end

  def authenticate_admin!
    authenticate_user!  # Devise's method to ensure the user is logged in
    unless current_user.admin?
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end
end
