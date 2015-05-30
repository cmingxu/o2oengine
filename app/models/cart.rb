class Cart
  attr_accessor :line_items, :sess
  def self.load(sess)
    cart = Cart.new
    cart.line_items = []
    cart.sess = sess
    return cart if sess[:cart].blank?
    ap sess[:cart].split("&")
    sess[:cart].split("&").each do |li|
      cart.line_items << LineItem.new(*li.split("="))
    end
    cart
  end

  def dump
    self.line_items.map do |li|
      "#{li.id}=#{li.quantity}"
    end.join("&")
  end

  def add id, quantity = 1
    l = self.line_items.find do |li|
      li.id == id.to_i
    end
    if l
      l.quantity += quantity.to_i
    else
      @line_items << LineItem.new(id, quantity)
    end

    update
  end

  def remove id
    l = self.line_items.find do |li|
      li.id == id.to_i
    end
    line_items.delete(l) if l
    update
  end

  def decrease id, quantity = 1
    l = self.line_items.find do |li|
      li.id == id.to_i
    end

    return unless l
    l.quantity -= quantity.to_i
    line_items.delete(l) if l.quantity <= 0
    update
  end

  def update
    sess[:cart] = self.dump
  end

  class LineItem
    attr_accessor :id, :quantity
    def initialize id, quantity
      @id = id.to_i
      @quantity = quantity.to_i
    end

    def product
      @product ||= Product.find(@id)
    end

    def price
      product.price * quantity
    end
  end
end
