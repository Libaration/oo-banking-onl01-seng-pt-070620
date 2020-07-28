class BankAccount
  attr_accessor :balance, :status
  attr_reader :name
  @@all = []
  def initialize(name, balance = 1000)
    @name = name
    @balance = balance
    @status = 'open'
    @@all << self
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status != 'closed' && @balance > 0 ? true : false
  end

  def close_account
    @status = 'closed'
  end

  def deposit(int)
    @balance += int
  end

  def self.all
    @@all
  end
end
