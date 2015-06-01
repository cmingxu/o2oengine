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

class Lb::Product < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :coupon_count, presence: true
  validates :reward_count, presence: true
  validates :price, presence: true
  validates :brand_id, presence: true

  belongs_to :lb_brand, :foreign_key => :brand_id, :class_name => "Lb::Brand"
  has_many :lb_orders, :foreign_key => :product_id, :class_name => "Lb::Order"
  has_many :lb_coupons, :foreign_key => :product_id, :class_name => "Lb::Coupon"

  before_save do
    self.water_type = self.lb_brand.water_type
  end

  acts_as_list
  mount_uploader :icon, ProductIconUploader
end
