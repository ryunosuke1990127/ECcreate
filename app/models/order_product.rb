class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :item

  def sabtotal
    unit_price * amount
  end
end
