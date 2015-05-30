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

require 'test_helper'

class StaffTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
