class JobsController < ApplicationController
  before_action :authenticate_employer!
  before_action :set_job, only: %i[ show edit update destroy ]

  def index
    @jobs = Job.where(employer_id: current_employer)
  end

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)

      if @job.save
        redirect_to @job, notice: "Job was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @job.update(job_params)
        redirect_to @job, notice: "Job was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @job.destroy!

      redirect_to jobs_path, status: :see_other, notice: "Job was successfully destroyed."
  end

  private
    def set_job
      @job = Job.find(params.expect(:id))
    end

    def job_params
      params.expect(job: [ :title, :description, :location, :mode, :requirements, :skills, :benefits, :salary ])
    end
end
