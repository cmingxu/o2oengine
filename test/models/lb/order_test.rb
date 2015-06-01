# == Schema Information
#
# Table name: lb_orders
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  coupon_id        :integer
#  product_id       :string(255)
#  quantity         :integer
#  staff_id         :integer
#  status           :string(255)
#  delay            :boolean
#  deliver_begin_at :datetime
#  reached_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class Lb::OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
