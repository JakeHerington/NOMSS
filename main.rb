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
orders.filter! { |order| orders_to_process.include? order.id }

ProcessOrder.process_orders(orders, products)