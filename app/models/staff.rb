# == Schema Information
#
# Table name: staffs
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  branch_id          :integer
#  login              :string(255)
#  encrypted_password :string(255)
#  salt               :string(255)
#  avatar             :string(255)
#  last_login_ip      :string(255)
#  last_login_at      :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Staff < ActiveRecord::Base
  mount_uploader :avatar, StaffAvatarUploader
  attr_accessor :password
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

  def self.login(login, pass)
    u = Staff.find_by_login(login)
    return nil if u.nil?

    u.password_valid?(pass) ? u : nil
  end

end
