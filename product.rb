class Product 
    def initialize(id, desc, quantity, reorder_thresh, reorder_amount, delivery_lead_time)
        @id = id
        @desc = desc
        @quantity = quantity
        @reorder_thresh = reorder_thresh
        @reorder_amount = reorder_amount
        @delivery_lead_time = delivery_lead_time
    end
end