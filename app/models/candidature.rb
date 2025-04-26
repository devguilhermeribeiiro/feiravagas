class Candidature < ApplicationRecord
  belongs_to :job
  belongs_to :job_seeker
  after_create_commit :set_status

  private

  def set_status
    self.status = true if self.status.eql?(false)
  end
end
