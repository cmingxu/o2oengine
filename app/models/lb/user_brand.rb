# == Schema Information
#
# Table name: lb_user_brands
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  brand_id   :integer
#  highlight  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Lb::UserBrand < ActiveRecord::Base
  belongs_to :lb_user
  belongs_to :lb_brand
end
