class CartItem < ApplicationRecord
  belongs_to :cusomer
  belongs_to :item
  
  def subtotal
    item.with_tax_price * amount
  end
end
