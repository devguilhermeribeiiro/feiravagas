class JobseekersController < ApplicationController
  before_action :authenticate_job_seeker!
  def index
    jobs = Job.all
    @jobs = jobs.order(created_at: :desc)
  end

  def job
    @job = Job.find(params.expect(:id))
  end

  def apply
    @job = Job.find(params.expect(:id))
    @job.candidatures.create(job_seeker: current_job_seeker)
  end

  def show
  end

  def edit
  end

  def unconfirmed
  end

  def update
  end

  def destroy
  end
end
