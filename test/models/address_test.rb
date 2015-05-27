# == Schema Information
#
# Table name: addresses
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  name           :string(255)
#  provice        :string(255)
#  city           :string(255)
#  detail_address :string(255)
#  postal_code    :string(255)
#  phone          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
