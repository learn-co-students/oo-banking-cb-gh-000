class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount, status='pending')
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if status == 'pending'
      if sender.balance - amount < 0
        self.status = 'rejected'
        'Transaction rejected. Please check your account balance.'
      else
        self.sender.deposit(-self.amount)
        self.receiver.deposit(self.amount)
        self.status = 'complete'
      end
    end
  end

  def reverse_transfer
    if status == 'complete'
      self.sender.deposit(self.amount)
      self.receiver.deposit(-self.amount)
      self.status = 'reversed'
    end
  end

end
