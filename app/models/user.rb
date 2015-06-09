# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  login              :string(255)
#  name               :string(255)
#  salt               :string(255)
#  address            :string(255)
#  phone              :string(255)
#  encrypted_password :string(255)
#  last_login_at      :string(255)
#  last_login_ip      :string(255)
#  source             :string(255)
#  last_product_id    :integer
#  last_quantity      :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  openid             :string(255)
#  next_time_free     :boolean
#

class User < ActiveRecord::Base
  SOURCE = {
    :wechat => "微信",
    :web    => "网站",
    :ios    => "iOS",
    :android => "Android"
  }

  #validates :phone, format: { with: /\A(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}\z/ }, :allow_nil => true

  has_many :lb_orders, :class_name => "Lb::Order"
  has_one :user_wechat
  before_create :set_default

  def set_default
    self.last_quantity = 1
  end

  def self.login_from_wechat(auth_callback, user_type = :vendor)
    user = User.find_or_initialize_by(:openid => auth_callback[:uid])
    info = auth_callback[:info]
    if (user_wechat = user.user_wechat).blank?
      user_wechat = UserWechat.new :user => user
    end

    user.source = :wechat
    user_wechat.nickname = info[:nickname]
    user_wechat.language = info[:language]
    user_wechat.province = info[:province]
    user_wechat.city = info[:city]
    user_wechat.sex = info[:sex]

    user.last_login_at = Time.now

    result = user.save
    result ? user : nil
  end

  def last_order
    @order ||= lb_orders.last
  end

  def last_product
    Lb::Product.find_by_id self.last_product_id
  end

  def can_place_order?
    [self.phone, self.address, self.last_product_id, self.last_quantity].all?{ |w| w.present? }
  end

  def calculated_price
    return 0 if self.last_product.nil?
    if should_give_for_free?
      (self.last_quantity - 1) * self.last_product.price + 0.01
    else
      self.last_product.price * self.last_quantity
    end
  end

  def should_give_for_free?
    return true if self.next_time_free # for conditions where last order was delay
    return true if self.lb_orders.paid_or_delivered_or_closed.blank? # first order
  end

  def last_processing_order
    self.lb_orders.paid_or_delivered_or_closed.last
  end

  def password_valid?(pass)
    self.encrypted_password == User.encrypted_password(pass, self.salt)
  end

  def password=(pass)
    self.salt = SecureRandom.hex(10)
    self.encrypted_password = User.encrypted_password(pass, self.salt)
  end

  def self.encrypted_password(pass, salt)
    Digest::SHA1.hexdigest(pass + "-" + salt)
  end

  def set_next_time_free
    self.update_column :next_time_free, true
  end
end
