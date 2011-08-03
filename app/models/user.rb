require 'digest/sha2'

#  
#  TommyUser
#     firstname: tommy
#     email: tommy@usa.gov
#     password_hash: asnotehus naotehu snaotehu snaotehu
#     salt: 1978-01-01 55:55:55
#
class User < ActiveRecord::Base

  attr_accessor :password

  def salt
    self[:salt] ||= Time.now
  end

  def valid_password? password
    self.password_hash == self.class.digest(password, salt)
  end

  def self.digest password, salt
    Digest::SHA512.hexdigest "__#{salt}__#{password}__"
  end
end
