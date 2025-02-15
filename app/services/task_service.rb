class TaskService
  def self.create_task(params, author)
    project_id = params[:project_id]
    project = Project.find(project_id)
    assignee_id = params[:assignee_id]
    assignee = User.find(assignee_id)

    task = Task.new(
      due_date: params[:due_date],
      status: params[:status],
      title: params[:title],
      author: author,
      assignee: assignee,
      project: project
    )
    if task.save
      return task
    else
      Rails.logger.error("Task creation failed: #{task.errors.full_messages.to_sentence}")
      raise StandardError, task.errors.full_messages.to_sentence
    end
  end
end