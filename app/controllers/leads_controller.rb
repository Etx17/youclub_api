class LeadsController < ApplicationController
  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      redirect_to root_path, notice: 'Thank you for your interest!'
    else
      redirect_to root_path, alert: 'Please enter a valid email address.'
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:email)
  end
end
