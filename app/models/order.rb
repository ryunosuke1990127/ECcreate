class Order < ApplicationRecord
  enum payment_method: {
    credit: 1, #クレジットカード
    bank: 2, #銀行振込
  }

  has_many :order_products, dependent: :destroy
  belongs_to :customer
   def with_tax_price
    (price * 1.1).floor
   end

end
