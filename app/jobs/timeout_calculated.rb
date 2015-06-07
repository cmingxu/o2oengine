# -*- encoding : utf-8 -*-
class TimeoutCalculated
  @queue = :timeout_calculation

  def self.perform(id)
    order = ::Lb::Order.find id
    if !order.closed?
      order.user.set_next_time_free
    end
  end
end

