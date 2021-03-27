class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:profile]
    #before anyone can go to the views of each method or route in this controller, they must first be logged in. I'm using it only on profile.
    def home
    end

    def about
    end

    def profile
    end
end
  
