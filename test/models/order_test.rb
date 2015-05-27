# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  total_price    :integer
#  order_status   :string(255)
#  ship_status    :string(255)
#  payment_status :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
