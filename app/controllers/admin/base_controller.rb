module Admin
    class BaseController < ApplicationController
        before_action :ensure_login!
        before_action :authenticate_admin!

        def ensure_login!
            redirect_to root_path unless current_user
        end

        def authenticate_admin!
            redirect_to root_path if !current_user.admin?
        end
    end
end