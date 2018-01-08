class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(acc1, acc2, amt)
    @sender = acc1
    @receiver = acc2
    @amount = amt
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @status == "pending"
      if valid? == true && @sender.balance - @amount > 0
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
end
