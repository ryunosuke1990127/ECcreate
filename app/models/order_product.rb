class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def sabtotal
    (unit_price*1.1).floor * amount
  end
end
