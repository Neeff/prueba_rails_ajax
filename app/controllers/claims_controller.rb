class ClaimsController < ApplicationController
  def create
    @claim = Claim.new(claim_params)
    @claim.user = current_user
    @claim.company_id = params[:company_id]
    if @claim.save
      respond_to :js
    else
      redirect_to root_path, alert: 'El Reclamo no pudo ser Ingresado'
    end
  end

  private

  def claim_params
    params.require(:claim).permit(:claim)
  end
end
