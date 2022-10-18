require "account"
require "statement"

describe Account do
  let(:statement) { double :statement }
  subject(:account) { Account.new(statement) }

  describe "#deposit" do
    it "is increasing account balance with deposit amount" do
      expect(account.balance).to eq(0.00)
      expect(statement).to receive(:add).with(2000.00, "13/01/2023", 2000.00, "debit")
      account.deposit(2000.00, "13/01/2023")
      expect(account.balance).to eq(2000.00)
    end

    it "returns summary of the transaction" do
      expect(statement).to receive(:add).with(2000.00, "13/01/2023", 2000.00, "debit").and_return({ date: "13/01/2023", credit: nil, debit: 2000.00, balance: 2000.00 })
      expect(account.deposit(2000.00, "13/01/2023")).to eq({ date: "13/01/2023", credit: nil, debit: 2000.00, balance: 2000.00 })
    end

    it "raise an error if the amoint is 0 or below" do
      message = "Error: Please enter a positive amount"
      expect { account.deposit(0.00, 13 / 01 / 2023) }.to raise_error message
    end
  end

  describe "#withdraw" do
    before(:each) do
      allow(statement).to receive(:add).with(1000, "10/01/2023", 1000.00, "debit")
      allow(statement).to receive(:add).with(500, "14/01/2023", 500.00, "credit")
    end

    it "is decreasing account balance with credit amount" do
      account.deposit(1000.00, '10/01/2023')
      expect(account.balance).to eq 1000.00
      account.withdraw(500.00, "14/01/2023")
      expect(account.balance).to eq 500.00
    end

    it "raises an error if the amount is more than the available balance" do
      account.deposit(1000.00, "10/01/2023")
      message = "Error: Can't withdraw more than balance, 1000.00"
      expect { account.withdraw(1500.00, 10 / 01 / 2023) }.to raise_error message
    end
  end
end
