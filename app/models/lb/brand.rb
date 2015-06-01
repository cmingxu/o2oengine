# == Schema Information
#
# Table name: lb_brands
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  water_type :string(255)
#  icon       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lb::Brand < ActiveRecord::Base
  WATER_TYPE = %w(纯净水 款泉水)
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :lb_products, :class_name => "Lb::Product", :foreign_key => :brand_id

  mount_uploader :icon, BrandIconUploader

  acts_as_list
end
