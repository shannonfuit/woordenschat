# user class
class User < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  has_many :answers
  has_many :played_levels
  has_many :achievements
  has_many :medals, through: :achievements

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, on: :create
  validates_presence_of :acro
  validates_uniqueness_of :acro

  def encrypt_password
    return unless password
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def authenticate(pass)
    password_hash == BCrypt::Engine.hash_secret(pass, password_salt)
  end

  def total_xp
    answers.sum(:xp) + medals.sum(:xp)
  end

  def won?(medal)
    medals.include? medal
  end
end
