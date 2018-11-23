RSpec.describe Question do
  describe "model attributes" do
    it "has content attribute" do
      expect(described_class.new).to respond_to(:content)
    end
  end
end
