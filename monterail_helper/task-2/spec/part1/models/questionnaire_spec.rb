RSpec.describe Questionnaire do
  describe "model attributes" do
    it "has name attribute" do
      expect(described_class.new).to respond_to(:name)
    end
  end
end
