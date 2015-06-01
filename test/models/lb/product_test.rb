# == Schema Information
#
# Table name: lb_products
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  brand_id     :integer
#  coupon_count :integer
#  reward_count :integer
#  water_type   :string(255)
#  price        :integer
#  desc         :text(65535)
#  icon         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class Lb::ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
