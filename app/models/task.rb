class Task < ApplicationRecord
  belongs_to :project
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :author, class_name: 'User'

  enum :status, [ :pending, :in_progress, :completed ]

  validates :title, presence: true
  validates :due_date, presence: true
  validates :project_id, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
end
