class JobseekersController < ApplicationController
  def index
    jobs = Job.all
    @jobs = jobs.order(created_at: :desc)
  end

  def job
    @job = Job.find(params.expect(:id))
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
