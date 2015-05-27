# == Schema Information
#
# Table name: shipments
#
#  id         :integer          not null, primary key
#  address_id :integer
#  order_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ShipmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
