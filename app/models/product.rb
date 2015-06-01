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
#  pinyin      :string(255)
#

class Product < ActiveRecord::Base
  validates :name, presence: true
  #validates :name, uniqueness: true
  validates :sku, presence: true
  #validates :sku, uniqueness: true
  validates :price, presence: true
  validates :quantity, presence: true

  belongs_to :order_item
  belongs_to :category

  before_save do
    self.pinyin = Pinyin.t(self.name).gsub(/\s+/, "-")
  end

  def to_param
    "#{self.id}-#{self.pinyin}"
  end

  mount_uploader :pic1, ProductIconUploader
  mount_uploader :pic2, ProductIconUploader
  mount_uploader :pic3, ProductIconUploader
  mount_uploader :pic4, ProductIconUploader
end
