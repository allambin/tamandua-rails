class TasksController < ApplicationController
  before_action :set_task, only: %i[ show update destroy ]
  before_action :authenticate_request, only: %i[ index show create update destroy ]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    task = TaskService.create_task(task_params, @current_user)
    render json: task, status: :created
  rescue StandardError => e
    # Rails.logger.error("Task creation failed: #{e.message}\n#{e.backtrace.join("\n")}")
    # Rails.logger.debug("Task Params: #{task_params.inspect}")
    # Rails.logger.debug("Current User: #{@current_user.inspect}")
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:title, :due_date, :project_id, :assignee_id, :status)
    end
end
