require 'account'
require 'statement'

describe Account do

  let(:statement) { double :statement }
  subject(:account) { Account.new(statement) }

  describe '#deposit' do
    it 'is increasing account balance with deposit amount' do
      expect(account.balance).to eq(0.00)
      expect(statement).to receive(:add).with(1000.00, "10/01/2022", 1000.00, "debit")
      account.deposit(1000.00, "10/01/2022")
      expect(account.balance).to eq(1000.00)
    end

    it 'returns summary of the transaction' do
      expect(statement).to receive(:add).with(1000.00, "10/01/2022", 1000.00, "debit").and_return({ date: "10/01/2022", credit: nil,  debit: 1000.00, balance: 1000.00 })
      expect(account.deposit(1000.00, '10/01/2022')).to eq({ date: '10/01/2022', credit: nil, debit: 1000.00, balance: 1000.00 })
    end

    it 'raise an error if the amoint is 0 or below' do
      message = "Error: Please enter a positive amount"
      expect { account.deposit(0.00, 10/01/2022) }.to raise_error message
    end


  end




end