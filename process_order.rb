module ProcessOrder
    def self.process_orders(products, orders)
        unfulfilled = []
        orders.each do |order|
            puts "\n-----\nprocessing order #{order.id}\n-----\n "
            order.items.each do |item|
                products.each do |product|
                    if product.id == item.product_id
                        puts "#{item.quantity} '#{product.desc}' required: #{product.quantity} available"
                        if (product.quantity - item.quantity) >= 0
                            product.decrement_quantity item.quantity
                            puts "product '#{product.desc}' has #{product.quantity} remaining in stock"
                        else
                            unfulfilled.push order.id
                            order.status = "unfulfilled"
                        end
                        if product.quantity < product.reorder_thresh && !product.reorder_placed
                            product.reorder
                            puts "'#{product.desc}' reorder placed"
                        end
                    end
                end
            end
            if !order.status.eql? "unfulfilled"
                order.status = "fulfilled"
            end
            puts "\norder #{order.id} #{order.status}"
        end
        unfulfilled.uniq
    end
end