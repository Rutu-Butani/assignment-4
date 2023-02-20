class Account
  attr_accessor :balance
  
  def initialize(balance)
    @balance = balance
    puts"Initial Balance is 35000"
  end
  
  def deposit(amount)
    @balance += amount
  end
  
  def withdraw(amount)
    if amount <= @balance
      @balance -= amount
    else
      puts "Insufficient funds."
    end
  end
end

class ATM
  def initialize(account)
    @account = account
  end
  
  def start
    puts "Please enter your PIN:"
    pin = gets.chomp.to_i
    if pin == 9876 
      show_options
    else
      puts "Invalid PIN."
    end
  end
  
  def show_options
    puts "Please select an option:"
    puts "1. Check balance"
    puts "2. Deposit"
    puts "3. Withdraw"
    choice = gets.chomp.to_i
    case choice
    when 1
      puts "Your balance is #{@account.balance}"
    when 2
      puts "How much would you like to deposit?"
      amount = gets.chomp.to_f
      deposit = Proc.new { |amount| @account.deposit(amount) }.call(amount)
      puts "Deposit successful. Your new balance is #{@account.balance}"
    when 3
      puts "How much would you like to withdraw?"
      amount = gets.chomp.to_f
      withdraw = Proc.new { |amount| @account.withdraw(amount) }.call(amount)
      puts "Withdrawal successful. Your new balance is #{@account.balance}"
    else
      puts "Invalid choice."
    end
  end
end
account = Account.new(35000)
atm = ATM.new(account)
atm.start

