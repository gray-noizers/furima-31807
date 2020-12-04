class ApplicationController < ActionController::Base
    before_action :configure_permitted_parametes, if: :devise_controller?
    before_action :basic_auth

    private
    def configure_permitted_parametes
        devise_parameter_sanitizer.permit(:sign_up, keys: [
            :nickname, :password, :family_name, :first_name, :family_name_furigana, :first_name_furigana, :birthday
        ])
    end

    def basic_auth
        authenticate_or_request_with_http_basic do |username, password|
          username == 'admin' && password == '2222'
        end
    end
end
