# 0.5% for a non-negative balance less than 1000 dollars.
# 1.621% for a positive balance greater than or equal to 1000 dollars and less than 5000 dollars.
# 2.475% for a positive balance greater than or equal to 5000 dollars.
# 3.213% for a negative balance (results in negative interest).

module SavingsAccount
  def self.interest_rate(balance)
    if balance >= 0 && balance < 1000
      0.5 # 0.5%
    elsif balance >= 1000 && balance < 5000
      1.621 # 1.621%
    elsif balance >= 5000
      2.475 # 2.475%
    else
      3.213 # 3.213%
    end
  end

  def self.annual_balance_update(balance)
    rate = interest_rate(balance) / 100.0
    balance + (balance * rate)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end
    years
  end
end
