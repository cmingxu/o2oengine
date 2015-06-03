# == Schema Information
#
# Table name: lb_products
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  water_type     :string(255)
#  brand          :string(255)
#  container_type :string(255)
#  sales          :integer
#  price          :integer
#  position       :integer
#  desc           :text(65535)
#  icon           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Lb::Product < ActiveRecord::Base
  WATER_TYPE = %w(矿泉水 纯净水)
  CONTAINER_TYPE = %w(大桶 小桶)

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :brand, presence: true
  validates :desc, presence: true
  #validates :icon, presence: true

  has_many :lb_orders, :foreign_key => :product_id, :class_name => "Lb::Order"

  acts_as_list
  mount_uploader :icon, ProductIconUploader
end
