require "statement"

describe Statement do
  subject(:statement) { Statement.new }

  describe "#add" do
    it 'adds deposit transactions to the transaction log' do
      statement.add(2000.00, "10/01/2023", 2000.00, "debit")
      expect(statement.log).to include({ date: "10/01/2023", credit: nil, debit: 2000.00, balance: 2000.00 })
    end

    it "adds withdrawal transactions to the trancastion log" do
      statement.add(2000.00, "10/01/2023", 1000.00, "credit")
      expect(statement.log).to include({ date: "10/01/2023", credit: 2000.00, debit: nil, balance: 1000.00 })
    end
  end

  describe "#print" do
    it "is printing out statment with reverse chromological order" do
    end
  end

  describe "#log" do
    it "returns the transaction log flattened and in reverse order" do
      statement.add(2000.00, "10/01/2023", 2000.00, "debit")
      statement.add(2000.00, "10/01/2023", 1000.00, "credit")
      expect(statement.log).to eq [{ date: "10/01/2023", credit: 2000.00, debit: nil, balance: 1000.00 }, { date: "10/01/2023", credit: nil, debit: 2000.00, balance: 2000.00 }]
    end
  end
end