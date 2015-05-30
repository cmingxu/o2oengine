# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  icon       :string(255)
#  position   :integer
#  desc       :text(65535)
#

class Category < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :products

  acts_as_list

  mount_uploader :icon, CategoryIconUploader
end
