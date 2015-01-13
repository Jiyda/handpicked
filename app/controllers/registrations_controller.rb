class RegistrationsController < Devise::RegistrationsController

  def update	  
    if needs_password?(@user, user_params)
      if @user.update_with_password(user_params_password_update)
        flash[:success] = 'User was successfully updated. Password was successfully updated'
        redirect_to edit_user_registration_path
      else
        error = true
      end
    else
      if @user.update_without_password(user_params)
        flash[:success] = 'User was successfully updated.'
        redirect_to edit_user_registration_path
      else
        error = true
      end
    end

    if error
      flash[:error] = @user.errors.full_messages.join(', ')
      render :edit
    end
	end

	private

	def needs_password?(user, user_params)
	  !user_params[:password].blank?
	end

	def user_params
	  params[:user].permit(:email, :password, :password_confirmation, :avatar)
	end

	#Need :current_password for password update
	def user_params_password_update
	  params[:user].permit(:email, :password, :password_confirmation, :current_password, :avatar)
	end
end