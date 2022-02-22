class Product
    attr_accessor :id, :desc, :quantity, :reorder_amount, :reorder_thresh, :delivery_lead_time, :reorder_placed

    def initialize(id, desc, quantity, reorder_thresh, reorder_amount, delivery_lead_time)
        @id = id
        @desc = desc
        @quantity = quantity
        @reorder_thresh = reorder_thresh
        @reorder_amount = reorder_amount
        @delivery_lead_time = delivery_lead_time
        @reorder_placed = false
    end

    def decrement_quantity amount
        @quantity -= amount
    end

    def reorder
        # @quantity += @reorder_amount
        @reorder_placed = true;
    end
end