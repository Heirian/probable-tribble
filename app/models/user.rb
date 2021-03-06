# frozen_string_literal: true

# This is the user model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  validates :email, format: { with: Devise.email_regexp,
                              uniqueness: { case_sensitive: false }, allow_nil: true }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_one :profile, dependent: :nullify

  after_create :ensure_profile

  private

  def auto_generate_name
    (email.split('@').first.capitalize + Time.now.nsec.to_s + SecureRandom.hex)[0..29]
  end

  def ensure_profile
    build_profile(username: auto_generate_name, bio: I18n.t(:autobio)).save
  end
end
