class JobseekersController < ApplicationController
  before_action :authenticate_job_seeker!
  before_action :set_job_seeker, only: %i[show edit update destroy]
  before_action :set_job, only: %i[job candidatures apply]
  def index
    jobs = Job.all
    @jobs = jobs.order(created_at: :desc)
  end

  def job
  end

  def candidatures
    @candidatures = @job.candidatures
  end

  def apply
    @job.candidatures.create(current_job_seeker)
  end

  def show
  end

  def edit
  end

  def unconfirmed
  end

  def update
    if @job_seeker.update(job_seeker_params)
      redirect_to jobseeker_url(@job_seeker), notice: "Perfil atualizado com sucesso"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    redirect_to root_url if @job_seeker.destroy!
  end

  private

  def set_job_seeker
    @job_seeker = JobSeeker.find(params.expect(:id))
  end

  def set_job
    @job = Job.find(params.expect(:id))
  end

  def job_seeker_params
    params.expect(job_seeker: [ :title, :description, :location, :mode, :requirements, :skills, :benefits, :salary ])
  end
end
