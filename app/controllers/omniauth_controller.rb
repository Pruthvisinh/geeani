class OmniauthController < ApplicationController
	def facebook
		@user = User.create_from_provider_data[request.env['omniauth.auth']]
		if @user.persisted?
			#sign_in_and_redirect @user
			sign_in_and_redirect root_path
			self_flash_message[:noice, :success, kind: 'Facebook'] if is_navigational_format?
		else
			Flash[:error] = 'There is a problem signing you in through facebook.Please register or try signing in later'
			redirect_to new_user_registration_url
		end
	end

	def github
		@user = User.create_from_github_data[request.env['omniauth.auth']]
		if @user.persisted?
			#sign_in_and_redirect @user
			sign_in_and_redirect root_path
			self_flash_message[:noice, :success, kind: 'Github'] if is_navigational_format?
		else
			Flash[:error] = 'There is a problem signing you in through github.Please register or try signing in later'
			redirect_to new_user_registration_url
		end
	end

	def google_oauth2
		@user = User.create_from_google_data[request.env['omniauth.auth']]
		if @user.persisted?
			#sign_in_and_redirect @user
			sign_in_and_redirect root_path
			self_flash_message[:noice, :success, kind: 'Google'] if is_navigational_format?
		else
			Flash[:error] = 'There is a problem signing you in through google.Please register or try signing in later'
			redirect_to new_user_registration_url
		end
	end

	def failure
		Flash[:error] = 'There was a problem signing you in.Please register and try again in later'
		redirect_to new_user_registration_url
	end
end
