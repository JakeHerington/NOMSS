class Order
    attr_accessor :id, :status, :date_created, :items

    def initialize(id, status, date_created, items)
        @id = id
        @status = status
        @date_created = date_created
        @items = items
    end
end
