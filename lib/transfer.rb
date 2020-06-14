
class Transfer
# your code here
attr_accessor :status
attr_reader :sender, :receiver, :amount

def initialize(sender, receiver, amount)
@sender = sender
@receiver = receiver
@amount = amount
@status = "pending"
end

def valid?
@sender.valid? && @receiver.valid? && @sender.balance >= @amount ? true : false
end

def execute_transaction
if @status == "complete"
  return "can transfer only 1 time"
elsif self.valid? == false
  @status = "rejected"
  return "Transaction rejected. Please check your account balance."
else
  @sender.balance -= @amount
  @receiver.balance += @amount
  @status = "complete"
end
end

def reverse_transfer
if @status == "complete"
  @sender.balance += @amount
  @receiver.balance -= @amount
  @status = "reversed"
end
end
end
