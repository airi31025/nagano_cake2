class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  def subtotal
    self.item.with_tax_price * self.amount
  end

end
