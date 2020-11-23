class ApplicationController < ActionController::Base
    before_action :configure_permitted_parametes, if: :devise_controller?

    private
    def configure_permitted_parametes
        devise_parameter_sanitizer.permit(:sign_up, keys: [
            :nickname, :password, :family_name, :first_name, :family_name_furigana, :first_name_furigana, :birthday
        ])
    end
end
