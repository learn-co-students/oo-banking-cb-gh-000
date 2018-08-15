class Transfer
  # your code here
  #
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount

  end

  def valid?
    @sender.valid? and @receiver.valid? and @amount > 0 and @sender.balance >= @amount and @status == 'pending'
  end

  def execute_transaction
    if valid?
      @sender.deposit(@amount - (@amount * 2))
      @receiver.deposit(@amount)
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."

    end

  end

  def reverse_transfer
    if @status == 'complete'
      @status = 'pending'
      temp = @sender
      @sender = @receiver
      @receiver = temp
      execute_transaction
      @status = 'reversed'
    end
  end

end
