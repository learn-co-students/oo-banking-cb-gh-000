class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount

    @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @sender.balance >= amount && @receiver.valid? == true
      return true
    else
      return false
    end
  end


  def execute_transaction
    if self.valid? == true && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      return @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end


  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      return @status = "reversed"
    end
  end

end
