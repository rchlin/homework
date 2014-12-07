class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :equipments
  attr_accessible :email, :institution, :money, :password, :phone, :type, :name, :remmember_token
  #has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format:{ with:VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  validates :email, :name, :password, presence: true

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
