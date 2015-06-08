# == Schema Information
#
# Table name: lb_orders
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  product_id       :string(255)
#  quantity         :integer
#  staff_id         :integer
#  status           :string(255)
#  delay            :boolean
#  deliver_begin_at :datetime
#  reached_at       :datetime
#  price            :integer
#  order_num        :string(255)
#  prepay_id        :string(255)
#  paid_at          :datetime
#  body             :string(255)
#  transaction_id   :string(255)
#  spbill_create_ip :string(255)
#  notify_url       :string(255)
#  bank_type        :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  give_for_free    :boolean
#

require 'test_helper'

class Lb::OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
