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

require 'test_helper'

class Lb::ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
