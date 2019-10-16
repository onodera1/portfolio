class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search



protected
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:nickname,:phone_number,])
    end


    def configure_update_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :nickname,:phone_number])
    end



    def set_search
      @q = Sharing.ransack(params[:q])
      @search_sharings = @q.result.page(params[:page]).per(5)
    end

end
