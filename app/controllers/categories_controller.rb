class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    if @category.jobs.empty?
      flash[:notice] = "Nenhuma vaga disponível"
    end
  end
end
