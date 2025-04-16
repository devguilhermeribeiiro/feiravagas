class JobseekersController < ApplicationController
  def index
    jobs = Job.all
    @jobs = jobs.order_by(&:created_at).reverse
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
