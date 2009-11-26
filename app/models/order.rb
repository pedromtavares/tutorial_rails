class Order < ActiveRecord::Base

  PAYMENT_TYPES = [
    #Displayed        stored in DB
    ["Check",         "check"],
    ["Credit card",   "cc"],
    ["Purchase order","po"]
  ]

  validates_presence_of :name, :address, :email, :pay_type
  validates_inclusion_of :pay_type, :in => PAYMENT_TYPES.map {|disp,value| value}

  has_many :line_items

  def add_line_items_from_cart(cart)
    cart.items.each do |item|
      li = LineItem.from_cart_item(item)
      self.line_items << li
    end
  end

  def total
    self.line_items.sum(:total_price)
  end
  
end
