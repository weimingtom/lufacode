Account = {
    balance=0,
    withdraw = function (self, v)
        self.balance = self.balance - v
        io.write("New balance (after withdraw): "..self.balance)
    end
}
    
function Account:deposit (v)
    self.balance = self.balance + v
    io.write("New balance (after deposit): "..self.balance)
end
    
Account.deposit(Account, 200.00)
Account:withdraw(100.00)
