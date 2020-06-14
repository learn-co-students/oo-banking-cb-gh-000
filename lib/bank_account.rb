class BankAccount
	attr_accessor :balance, :status
	attr_reader :name
	def initialize(name, balance=1000)
		@name = name
		@balance = balance
		@status = "open"
	end

	def deposit(amount)
		@balance += amount
	end

	def balance
		@balance
	end

	def display_balance
		"Your balance is $#{self.balance}."
	end

	def valid?
		@status == "open" && @balance > 0
	end

	def close_account
		@status = "closed"
		@balance = 0
	end

end
