require "./product"
require "./item"
require "./order"
require "./process_order"

product = Product.new(1, 'widget', 20, 10, 50, 5)
item = Item.new(1123, 1, 15, 10)
order1 = Order.new(1123, "pending", "2018-05-09 14:21", [item])
order2 = Order.new(1124, "pending", "2018-05-09 14:22", [item])

puts "class Product:"
puts " function:'decrement_quantity'"
puts "  decreases quantity available correctly"

correct_amount = 5
product.decrement_quantity item.quantity

puts "  #{product.quantity == correct_amount}"

puts "module ProcessOrder:"
puts " function: 'process_orders'"

product = Product.new(1, 'widget', 20, 10, 50, 5)
unfulfilled_orders = ProcessOrder.process_orders([product], [order1, order2])

puts "\n  fulfils order if stock available"
puts "  #{order1.status.eql? "fulfilled"}"

puts "  doesn't fulfil order if stock unavailable"
puts "  #{order2.status.eql? "unfulfilled"}"

puts "  returns array of unfulfilled orders"
puts "  #{unfulfilled_orders == [1124]}"

puts "  places reorder for product if quantity decreases below threshold"
puts "  #{product.reorder_placed}"
