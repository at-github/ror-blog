class UserSession < Authlogic::Session::Base
  validate :email, presence: true
  validate :password, presence: true, length: { minimum: 6 }
end
