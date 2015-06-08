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

  scope :paid_or_delivered_or_closed, -> { where("status NOT IN ('paid', 'closed', 'delivering')") }
  scope :closed, -> { where(:status => :closed) }

  state_machine :status do
    after_transition :on => :pay, :do => :set_time_click
    after_transition :on => :pay, :do => :user_next_free_set_to_false
    after_transition :on => :pay, :do => :set_next_time_free

    event :pay do
      transition :from => :not_paid, :to => :paid
    end

    event :deliver do
      transition :from => :paid, :to => :delivering
    end

    event :close do
      transition :from => [:delivered], :to => :closed
    end
  end

  def set_time_click
    #Resque.enqueue_at 27.minute.from_now, FreeDeterminator, self.id
  end

  def user_next_free_set_to_false
    self.user.update_column :next_time_free, false
  end

  def set_next_time_free
    last_free_order_time = self.user.lb_orders.closed.where(:give_for_free => true).order("id DESC").first.try(:created_at) || 10.years.from_now
    quantity = self.user.lb_orders.closed.where(["created_at > ?", last_free_order_time]).inject(0) { |sum, o| sum+=o.quantity; sum}
    self.user.set_next_time_free if quantity >= 4
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
