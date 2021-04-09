class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_task, only: %i[ show edit update destroy ]
  
  # GET /tasks or /tasks.json
  def index
    @tasks = @category.tasks
    # @user = current_user
    # @tasks = current_user.tasks.order('created_at desc')
    # @tasks = current_user.tasks.paginate(page: params[:page], per_page: 3).order('created_at desc')
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = @category.tasks.build
  end

  # GET /tasks/1/edit
  def edit
    session[:return_to] ||= request.referer
  end

  # POST /tasks or /tasks.json
  def create
    @task = @category.tasks.build(task_params)

    if @task.save
        redirect_to category_tasks_path, notice: "Entry was successfully created."
    else
       render action: 'new'
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    if @task.update(task_params)
      if @task.saved_change_to_attribute?("item") || @task.saved_change_to_attribute?("description")
        redirect_to session.delete(:return_to), notice: "Entry was successfully updated."
      elsif @task.saved_change_to_attribute?("status")
        redirect_to session.delete(:return_to), notice: "Status was successfully updated."
      elsif @task.saved_change_to_attribute?("deadline")
        redirect_to session.delete(:return_to), notice: "Deadline was successfully changed."
      else
        redirect_back(fallback_location: root_path)
      end
      # redirect_to session.delete(:return_to)
    else
       render action: 'edit'
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    redirect_back(fallback_location: root_path, alert: "Entry was deleted.")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = current_user.categories.find(params[:category_id])
    end

    def set_task
      @task = @category.tasks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:item, :description, :status, :deadline)
    end
end
