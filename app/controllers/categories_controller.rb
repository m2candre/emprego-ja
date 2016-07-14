class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    if @category.jobs.empty?
      flash[:notice] = "Nenhuma vaga disponível"
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params.require(:category).permit(:name))
    if @category.save
      redirect_to @category
    else
      flash[:notice] = "Não foi possível criar a categoria"
      render :new
    end
  end
end
