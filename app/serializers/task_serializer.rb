class TaskSerializer < ActiveModel::Serializer
  attributes :id, :due_date, :status
  belongs_to :project, serializer: ProjectSerializer
  belongs_to :assignee, serializer: UserSerializer
  belongs_to :author, serializer: UserSerializer

  def status
    object.status.capitalize
  end
end
