class Candidate < ApplicationRecord
  # Create sop: Model/ Migration table data/ Route/ Controller/ Views
  has_many :vote_logs, dependent: :destroy
end
