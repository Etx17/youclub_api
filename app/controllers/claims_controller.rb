class ClaimsController < ApplicationController
  before_action :authenticate_user!

  def new
    @club = Club.find(params[:club_id])
    @claim = Claim.new
  end

  def create
    @club = Club.find(params[:club_id])
    @claim = @club.build_claim(claim_params.merge(user: current_user))

    if @claim.save
      # Handle successful claim creation
      redirect_to @club, notice: 'Claim was successfully submitted.'
    else
      render :new
    end
  end

  private

  def claim_params
    params.require(:claim).permit(:full_name, :contact_email, :phone_number, :verification_document)
  end
end
