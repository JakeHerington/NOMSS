class Item
    attr_accessor :order_id, :product_id, :quantity, :cost_per_item

    def initialize(order_id, product_id, quantity, cost_per_item)
        @order_id = order_id
        @product_id = product_id
        @quantity = quantity
        @cost_per_item = cost_per_item
    end
end