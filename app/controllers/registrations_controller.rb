class RegistrationsController < Devise::RegistrationsController
    def create
        @user = User.new(sign_up_params)
        if @user.save!
          # Send the welcome email
          #byebug
          UserMailer.welcome_email(@user).deliver_now
          redirect_to new_user_session_path
          # Redirect or perform any other actions as needed
        else
          render :new
        end
    end
    private
    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
    end

    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :role)
    end
end
