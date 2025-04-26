class Job < ApplicationRecord
  belongs_to :employer

  has_many :candidatures, dependent: :destroy
  has_many :job_seekers, through: :candidatures
end
