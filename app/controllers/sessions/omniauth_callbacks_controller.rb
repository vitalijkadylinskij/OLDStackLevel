class Sessions::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    Rails.logger.info("OMNIAUTH DATA: #{request.env['omniauth.auth']}")
    sign_in_via_omniauth(request.env['omniauth.auth'].info)
    try_to_redirect_to_last_url
  end

  private

  def sign_in_via_omniauth(omniauth)
    user = User.find_or_create_by(email: omniauth.email, name: omniauth.name)
    Rails.logger.info("USER: #{user.inspect}")
    sign_in(user)
  end

  def try_to_redirect_to_last_url
    Rails.logger.info("LAST URL: #{session[:last_url]}")
    if session[:last_url].present?
      redirect_to(session[:last_url])
    else
      redirect_to(root_path)
    end
  end

  def after_omniauth_failure_path_for(_)
    Rails.logger.info("FAIL AUTH!!!")
    root_path
  end
end
