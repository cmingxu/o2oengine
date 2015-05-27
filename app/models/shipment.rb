# == Schema Information
#
# Table name: shipments
#
#  id         :integer          not null, primary key
#  address_id :integer
#  order_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Shipment < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
end
