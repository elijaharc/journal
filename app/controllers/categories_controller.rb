class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = current_user.categories.paginate(page: params[:page], per_page: 5)
  end

  # GET /categories/1 or /categories/1.json
  def show
    @task = @category.tasks.build
  end

  # GET /categories/new
  def new
    @category = current_user.categories.build
  end

  # GET /categories/1/edit
  def edit
    session[:return_to] ||= request.referer
  end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.build(category_params)
    @category.user = current_user

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_tasks_path(@category), notice: "Journal was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    if @category.update(category_params)
      if @category.saved_change_to_attribute?("category_name") || @category.saved_change_to_attribute?("description")
        redirect_to session.delete(:return_to), notice: "Journal was successfully updated."
      elsif @category.saved_change_to_attribute?("order_by")
        redirect_to category_tasks_path(@category), notice: "Task sorting changed."
      else
        redirect_back(fallback_location: root_path)
      end
    else
      render action: 'edit'
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, alert: "Journal was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = current_user.categories.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:category_name, :description, :order_by)
    end
end
