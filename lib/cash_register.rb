# [<0>]
require 'pry'

class CashRegister

    attr_accessor :employee_discount, :total, :quantity, :last_transaction, :items

    def initialize (employee_discount = 0)
        @employee_discount = employee_discount
        @total = 0
        @items = []
    end


    def add_item(title, price, quantity=1)
        self.last_transaction = price * quantity
        self.total += self.last_transaction
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        if self.employee_discount != 0
            discounted_to_float = (self.employee_discount.to_f / 100)
            #
            self.total = self.total - (self.total * discounted_to_float).to_i
            # binding.pry
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end


end

# transaction = CashRegister.new(20)
# binding.pry