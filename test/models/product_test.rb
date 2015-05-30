# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  price       :integer
#  sku         :string(255)
#  desc        :text(65535)
#  quantity    :integer
#  pic1        :string(255)
#  pic2        :string(255)
#  pic3        :string(255)
#  pic4        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
