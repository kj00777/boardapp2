class UsersController < GeneralController
    skip_before_action :require_login, only: [:index, :new, :create]

    def new
        
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = t 'users.flash.success'
            redirect_to root_path
            
        else
            flash[:danger]= t 'users.flash.danger'
            render :new
            
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :image, :password, :crypted_password)
    end
end
