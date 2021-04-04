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
      # if @current_user.update(user_params)
      #   # redirect_to categories_path
      # else
      #   render action: 'edit'
      # end
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
