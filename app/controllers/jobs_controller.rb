class JobsController < ApplicationController
  before_action :set_collections, only: [:new, :edit]
  before_action :find_job,        only: [:show, :edit, :update]

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job
    else
      flash[:notice] = "Não foi possível criar a vaga"
      set_collections
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update_attributes(job_params)
      redirect_to @job
    else
      flash[:notice] = "Não foi possível atualizar a vaga"
      set_collections
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :category_id, :company_id, :description, :featured)
  end

  def set_collections
    @companies = Company.all
    @categories = Category.all
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
