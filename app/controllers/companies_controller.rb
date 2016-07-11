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
  end
end
