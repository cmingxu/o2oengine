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
  has_many :orders
end
