# frozen_string_literal: true

Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    raise "Please configure doorkeeper resource_owner_authenticator block located in #{__FILE__}"
    # Put your resource owner authentication logic here.
    # Example implementation:
    #   User.find_by(id: session[:user_id]) || redirect_to(new_user_session_url)
    current_user || warden.authentication(scope: :user)
  end

  admin_authenticator do
    current_user.admin_role? || redirect_to(new_user_session_url)
  end
  authorization_code_expires_in 24.hours
  access_token_expires_in 24.hours
end
