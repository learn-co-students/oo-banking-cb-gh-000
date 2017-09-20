class Transfer
  # your code here
  attr_reader :sender,:receiver,:amount,:status
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    result = ""
    if((@sender.balance - @amount) < 0)
      result = "Transaction rejected. Please check your account balance."
      @status = "rejected"
    elsif @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
    result
  end

  def reverse_transfer
    if(@status == "complete")
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
