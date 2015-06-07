# -*- encoding : utf-8 -*-
class FreeDeterminator
  @queue = :timeout_calculation

  def self.perform(id)
    order = ::Lb::Order.find id
    if !order.closed?
      order.user.set_next_time_free
      order.delay = true
      order.save
    end
  end
end

