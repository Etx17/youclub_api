class ClaimsController < ApplicationController
  before_action :authenticate_user!

  def new
    @club = Club.find(params[:club_id])
    @claim = Claim.new
  end

  def create
    @club = Club.find(params[:claim][:club_id])
    # @claim = @club.build_claim(claim_params.merge(user: current_user))
    @claim = Claim.new(claim_params)
    if @claim.save
      redirect_to club_path(@club), notice: 'Réclamation soumise avec succès. Vous serez contactés prochainement par email.'
    else
      render :new
    end
  end

  private

  def claim_params
    params.require(:claim).permit(:full_name, :contact_email, :phone_number, :verification_document, :user_id, :club_id)
  end
end
