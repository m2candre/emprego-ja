class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def create
    @company = Company.create(params.require(:company).permit(:name, :location, :mail, :phone))

    redirect_to @company
  end

  def show
    @company = Company.find(params[:id])
    if @company.jobs.empty?
      flash[:notice] = "Nenhuma vaga disponível"
    end
  end
end
