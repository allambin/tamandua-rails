class TaskSerializer < ActiveModel::Serializer
  attributes :id, :due_date, :status
end
