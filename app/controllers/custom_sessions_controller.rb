class CustomSessionsController < Devise::SessionsController
    def after_sign_out_path_for(resource_or_scope)
        '/users/sign_in'
    end
    def log_out
        sign_out current_user
        redirect_to '/users/sign_in'
      end
end