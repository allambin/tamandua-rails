class TaskService
  def self.create_task(params)
    project_id = params[:project_id]
    project = Project.find(project_id)
    
    task = Task.new(params)
    task.project = project
    if task.save
      return task
    else
      raise StandardError, user.errors.full_messages.to_sentence
    end
  end
end