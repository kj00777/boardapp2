class Admin::UserSessionsController < AdminController

    skip_before_action :require_login, except: [:destroy], raise: false

    def new
        render :layout => "before_login"
        @user = User.new
    end

    def create
        
        if (@user = login(params[:email], params[:password])) && @user.user_type == "admin"
            flash[:danger]= t 'user_sessions.flash.success'
            redirect_to(admin_dashboards_path, notice: 'Login successful')
        elsif (@user = login(params[:email], params[:password])) && @user.user_type == "user"
            flash[:danger]= t 'user_sessions.flash.danger'
            
            redirect_to admin_notadminuser_path
        else
            flash.now[:danger] = t('.login_fail')
            render :new
        end
    end

    def destroy
        logout
        redirect_to "/admin/login"
    end

    private

    def user_session_params
        params.permit(:email, :password)
    end
end
