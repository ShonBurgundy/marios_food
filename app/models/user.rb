class User < ApplicationRecord
  attr_accessor :password

  validates_confirmation_of :password
  validates :password, :format => {:with => /\A(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,}\z/, 
  message: "must be at least 8 characters and include one number, one letter, and a special character."}
  validates :email, 
    :presence => true,
    :uniqueness => true, 
    confirmation: { case_sensitive: false }
  validates :name, 
    :presence => true, 
    confirmation: { case_sensitive: false }
  before_save :encrypt_password
  
end