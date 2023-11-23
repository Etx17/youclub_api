class CookiesController < ApplicationController
  def index
  end

  def policy
  end

  def consent
    session[:cookie_consent] = params[:consent].presence

    render turbo_stream: turbo_stream.remove(:cookie_consent)
  end
end
