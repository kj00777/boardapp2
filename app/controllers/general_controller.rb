class GeneralController < ApplicationController
    before_action :require_login

    protected
    
    def not_authenticated
      redirect_to login_path
    end
end
