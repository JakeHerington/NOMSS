require "json"
require "./product"
require "./item"
require "./order"
require "./process_order"

# initialize data
file = File.read "data.json"
data = JSON.parse file

products = []
orders = []

data["products"].each do |product| 
    products.push Product.new(product["productId"], product["description"], product["quantityOnHand"], product["reorderThreshold"], product["reorderAmount"], product["deliveryLeadTime"])
end

data["orders"].each do |order|
    items = []
    order["items"].each do |item|
        items.push Item.new(item["orderId"], item["productId"], item["quantity"], item["costPerItem"])
    end
    orders.push Order.new(order["orderId"], order["status"], order["dateCreated"], items)
end

orders_to_process = ARGV[0].delete("[]").split(",").map(&:to_i)
puts "\nprocessing the following orders: #{orders_to_process}"
puts "removing invalid orders"
orders.filter! { |order| orders_to_process.include? order.id }
orders_to_process = orders.map { |order| order.id }.uniq
puts "remaining orders: #{orders_to_process}"

unfulfilled_orders = ProcessOrder.process_orders(products, orders)
puts "\nthe following orders were unfulfilled: #{unfulfilled_orders}"
