class User < ApplicationRecord
  acts_as_authentic do |config|
    config.crypto_provider = Authlogic::CryptoProviders::Sha512
  end

  # Don't include column name in error
  HUMANIZED_ATTRIBUTES = { email: '', password: '', password_confirmation: '' }.freeze

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  validates :email,
            presence: { message: 'Email obligatoire' },
            format: {
              with: /@/,
              message: 'Email valide svp'
            },
            length: { maximum: 100 },
            uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6, message: 'Trop court' }, confirmation: true
  validates :password_confirmation, presence: true

  enum :roles, { ADMIN: 'ADMIN', USER: 'USER' }
end
