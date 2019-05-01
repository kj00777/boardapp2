class UserSessionsController < GeneralController
    skip_before_action :require_login, except: [:destroy], raise: false

    def new
        render :layout => "before_login"
        @user = User.new
    end

    def create
        
        @user = login(params[:email], params[:password])
        
        if @user = login(params[:email], params[:password])
            flash[:danger]= t 'user_sessions.flash.success'
            redirect_back_or_to(root_path, notice: 'Login successful')
          else
            flash[:danger]= t 'user_sessions.flash.danger'
            
            render action: 'new'
          end
    end

    def destroy
        logout
        redirect_to "/login"
    end

    private

    def user_session_params
        params.permit(:email, :password)
    end
end