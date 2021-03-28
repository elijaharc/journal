class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_task, only: %i[ show edit update destroy ]
  


  # GET /tasks or /tasks.json
  def index
    @tasks = @category.tasks.paginate(page: params[:page], per_page: 3).order('created_at desc')
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
  end

  # POST /tasks or /tasks.json
  def create
    @task = @category.tasks.build(task_params)

    if @task.save
        redirect_to([@task.category, @task], notice: "Task was succesfully created.")
    else
       render action: 'edit'
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to category_task_path(@category), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to category_tasks_url(@category), notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
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
      params.require(:task).permit(:item, :description, :status)
    end
end
