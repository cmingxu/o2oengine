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

require 'test_helper'

class Lb::BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
