class IncomeTax
  TAX = 0.1
  LIMIT = 200

  def self.calculate(balance)
    tax = balance * TAX
    tax = 200 if tax > LIMIT
    tax
  end
end