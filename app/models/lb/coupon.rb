# == Schema Information
#
# Table name: lb_coupons
#
#  id             :integer          not null, primary key
#  product_id     :integer
#  count          :integer
#  price          :integer
#  remain_count   :integer
#  user_id        :integer
#  coupon_type    :string(255)
#  prepare_id     :string(255)
#  transaction_id :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Lb::Coupon < ActiveRecord::Base
  has_many :lb_orders
  belongs_to :lb_product, :foreign_key => :product_id, :class_name => "Lb::Product"
end
