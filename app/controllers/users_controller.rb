class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    before_action :set_user, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @users = User.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @user = current_user
  end

  # GET /categories/1/edit
  def edit
    @user = current_user 
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
      if @current_user.update(user_params)
        if @current_user.saved_change_to_attribute?("first_name") || @current_user.saved_change_to_attribute?("last_name")
          redirect_to home_path, notice: "Your name has been updated successfully."
        elsif @current_user.saved_change_to_attribute?("order_categories_by")
          redirect_to categories_path, notice: "Journal sorting changed."
        else
          redirect_back(fallback_location: root_path)
        end
      else
        render action: 'edit'
      end
  end

  private
    def set_user
      @user = current_user.id
    end
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :order_categories_by)
    end
end
