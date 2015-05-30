# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  login              :string(255)
#  name               :string(255)
#  salt               :string(255)
#  encrypted_password :string(255)
#  last_login_at      :string(255)
#  last_login_ip      :string(255)
#  source             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ActiveRecord::Base
  SOURCE = {
    :wechat => "微信",
    :web    => "网站",
    :ios    => "iOS",
    :android => "Android"
  }

  has_many :orders

  def password_valid?(pass)
    self.encrypted_password == User.encrypted_password(pass, self.salt)
  end

  def password=(pass)
    self.salt = SecureRandom.hex(10)
    self.encrypted_password = User.encrypted_password(pass, self.salt)
  end

  def self.encrypted_password(pass, salt)
    Digest::SHA1.hexdigest(pass + "-" + salt)
  end
end
