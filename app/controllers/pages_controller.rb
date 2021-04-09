class PagesController < ApplicationController

    before_action :authenticate_user!, only: [:tasks, :search, :profile]
    #before anyone can go to the views of each method or route in this controller, they must first be logged in. I'm using it only on profile.
    def home
    end

    def about
    end

    def profile
    end

    def tasks
        # @tasks = current_user.tasks.order('deadline asc')
        @q = current_user.tasks.ransack(params[:q])
        @tasks = @q.result(distinct: true).includes(:category).order('deadline asc')
    end

    # def search
    #     tasks
    #     render :tasks
    #     # @tasks = current_user.tasks.where('item LIKE ?', '%' + params[:q] + '%').order('deadline asc')
    # end
end