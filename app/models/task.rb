class Task < ApplicationRecord
  belongs_to :project

  enum :status, [ :pending, :in_progress, :completed ]

  validates :title, presence: true
  validates :due_date, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
end
