class AuthenticationsController < ApplicationController
  def all

    # raise request.env["omniauth.auth"].to_yaml
    
    omni = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    binding.pry

    if authentication
      flash.notice = "Authentication successful (1)"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      token = omni['credentials'].token
      token_secret = omni['credentials'].secret

      current_user.authentications.create!(provider: omni['provider'], uid: omni['uid'], token: token, token_secret: token_secret)
      flash[:notice] = "Authentication successful (2)"
      sign_in_and_redirect current_user
    else
     user = User.new
     user.apply_omniauth(omni)

     if user.save
      flash[:notice] = "Authentication successful (3)"
      sign_in_and_redirect User.find(user.id)
    else
      session[:omniauth] = omni.except('extra')
      redirect_to new_user_registration_path
    end
  end
end

alias_method :twitter, :all
alias_method :google_oauth2, :all

end