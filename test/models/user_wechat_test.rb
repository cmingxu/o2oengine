# == Schema Information
#
# Table name: user_wechats
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  openid         :string(255)
#  nickname       :string(255)
#  sex            :string(255)
#  language       :string(255)
#  province       :string(255)
#  city           :string(255)
#  subscribe_time :datetime
#  unionid        :string(255)
#  headimg        :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class UserWechatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
