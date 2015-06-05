# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  login              :string(255)
#  name               :string(255)
#  salt               :string(255)
#  address            :string(255)
#  phone              :string(255)
#  encrypted_password :string(255)
#  last_login_at      :string(255)
#  last_login_ip      :string(255)
#  source             :string(255)
#  last_product_id    :integer
#  last_quantity      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  openid             :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
