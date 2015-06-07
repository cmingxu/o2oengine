# == Schema Information
#
# Table name: lb_orders
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  product_id       :string(255)
#  quantity         :integer
#  staff_id         :integer
#  status           :string(255)
#  delay            :boolean
#  deliver_begin_at :datetime
#  reached_at       :datetime
#  price            :integer
#  order_num        :string(255)
#  prepay_id        :string(255)
#  paid_at          :datetime
#  body             :string(255)
#  transaction_id   :string(255)
#  spbill_create_ip :string(255)
#  notify_url       :string(255)
#  bank_type        :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Lb::Order < ActiveRecord::Base
  belongs_to :lb_product, :foreign_key => :product_id, :class_name => "Lb::Product"
  belongs_to :user
  belongs_to :staff

  before_create do
    self.order_num = "%06d" % self.class.count
    self.status = 'not_paid'
  end

  scope :paid_or_delivered_or_closed, -> { where("status NOT IN ('paid', 'closed', 'delivered')") }

  state_machine :status do
    after_transition :on => :pay, :do => :set_time_click

    event :pay do
      transition :from => :not_paid, :to => :paid
    end

    event :deliver do
      transition :from => :paid, :to => :delivered
    end

    event :closed do
      transition :from => [:delivered], :to => :closed
    end
  end

  def set_time_click
    Resque.enqueue_at 27.minute.from_now, TimeoutCalculated, self.id
  end

  def prepay_params
    {
      body: self.body,
      out_trade_no: self.order_num,
      total_fee: self.price , # after calculation when created
      spbill_create_ip: self.spbill_create_ip,
      notify_url: self.notify_url,
      trade_type: 'JSAPI',
      openid: self.user.openid
    }
  end


end
