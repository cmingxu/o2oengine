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

require 'test_helper'

class Lb::UserBrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
