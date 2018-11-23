require_relative "setup"

require_relative "expected_query_result"

describe Query do
  subject(:query) { Query.new }

  describe "#get" do
    subject { query.get(today: Date.parse("2017-10-18")) }

    it "returns correct data" do
      expect(subject).to eq(EXPECTED_QUERY_RESULT)
    end
  end
end
