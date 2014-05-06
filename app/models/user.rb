class User < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  has_many :answers

  attr_accessor :password
  before_save :encrypt_password


  validates_confirmation_of :password
  #validates_presence_of :password, :on => :create
  validates_presence_of :acro
  validates_uniqueness_of :acro

  def encrypt_password
    #raise password.inspect
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(acro, password)
    user = find_by_acro(acro)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def totalxp
    xp = self.answers.sum(:xp)
    if xp.nil?
      xp = 0
    else xp 
    end
  end
end