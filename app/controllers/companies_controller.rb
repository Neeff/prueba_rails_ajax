class CompaniesController < ApplicationController
  before_action :authenticate_user!, only: %i[show create edit destroy]
  def index
    @companies = Company.all
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      respond_to :js
    else
      redirect_to root_path, alert: 'La compañia no ha sido creada'
    end
  end

  def show
    @company = Company.find(params[:id])
    @claim = Claim.new
    @claims = Claim.where(company_id: @company.id).reverse_order
  end

  def edit
    @company = Company.find(params[:id])
    respond_to :js
  end
  
  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      respond_to :js
    else 
      redirect_to root_path, alert: 'Registro No actualizado Intente nuevamente'
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    respond_to :js
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
