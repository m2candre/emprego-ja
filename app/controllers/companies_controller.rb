class CompaniesController < ApplicationController
  before_action :find_company,        only: [:show, :edit, :update]


  def new
    @company = Company.new
  end

  def create
    @company = Company.new(companies_params)
    if @company.save
      redirect_to @company
    else
      flash[:notice] = "Não foi possível atualizar a empresa"
      render :new
    end
  end

  def show
    if @company.jobs.empty?
      flash[:notice] = "Nenhuma vaga disponível"
    end
  end

  def edit
  end

  def update
    if @company.update_attributes(companies_params)
      redirect_to @company
    else
      flash[:notice] = "Não foi possível atualizar a empresa"
      render :edit
    end
  end

private

  def companies_params
    params.require(:company).permit(:name, :location, :mail, :phone)
  end

  def find_company
    @company = Company.find(params[:id])
  end

end
