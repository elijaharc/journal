class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]

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
    respond_to do |format|
      if @current_user.update(user_params)
        format.html { redirect_to current_user, notice: "You have successfully updated your profile." }
        
      else
        format.html { render :edit }

      end
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email)
    end
end
