class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: [:google_oauth2]
end
