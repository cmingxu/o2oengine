# == Schema Information
#
# Table name: branches
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  contact    :string(255)
#  lng        :decimal(10, )
#  lat        :decimal(10, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BranchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
