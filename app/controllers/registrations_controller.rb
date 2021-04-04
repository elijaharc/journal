class RegistrationsController < Devise::RegistrationsController

    # to change redirect_to after editing profile
    protected
  
      def after_update_path_for(resource)
          home_path(resource)
      end
  end