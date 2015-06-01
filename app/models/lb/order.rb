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

class Lb::Order < ActiveRecord::Base
  belongs_to :lb_coupon, :foreign_key => :coupon_id, :class_name => "Lb::Coupon"
  belongs_to :lb_product, :foreign_key => :product_id, :class_name => "Lb::Product"
  belongs_to :user
  belongs_to :staff
end
