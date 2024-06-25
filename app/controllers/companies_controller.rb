class CompaniesController < ApplicationController

  def index
    companies = Company.all#.paginate(per_page: 5)
    render json: companies, status: :ok
  end

  def show
    company = Company.find(params[:id])
    render json: company, status: :ok
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: company, status: :ok
    else
      render json: company.errors, status: :unprocessable_entity
    end
  end

  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      render json: company, status: :ok
    else
      render json: company.errors, status: :unprocessable_entity
    end
  end

  def destroy
    company = Company.find(params[:id])
    if company.destroy
      render json: company, status: :ok
    else
      render json: company.errors, status: :unprocessable_entity
    end
  end


  private

  def company_params
    params.require(:company).permit(:company_name, :company_code, :email_id, :strength, :website)
  end
end
