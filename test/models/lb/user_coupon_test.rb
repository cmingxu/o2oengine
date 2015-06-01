# == Schema Information
#
# Table name: lb_user_coupons
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  coupon_id    :integer
#  count        :integer
#  remain_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class Lb::UserCouponTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
