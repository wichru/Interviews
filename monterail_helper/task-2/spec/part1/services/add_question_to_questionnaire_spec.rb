require "spec_helper"

RSpec.describe AddQuestionToQuestionnaire do
  subject { described_class.new(questionnaire: questionnaire, question: added_question).call }

  let(:questionnaire) { create(:questionnaire) }
  let(:added_question) { create(:question) }

  context "when adding one question to an empty questionnaire" do
    subject { described_class.new(questionnaire: questionnaire, question: added_question).call }

    before { subject }
    it { expect(questions_of_questionnaire_in_order.to_a).to eq([added_question]) }
  end

  context "when adding multiple questions to a questionnaire" do
    let(:questions) { create_list(:question, 4) }
    subject do
      described_class.new(questionnaire: questionnaire, question: questions[0]).call
      described_class.new(questionnaire: questionnaire, question: questions[1]).call
      described_class.new(questionnaire: questionnaire, question: questions[2]).call
      described_class.new(questionnaire: questionnaire, question: questions[3]).call
    end

    before { subject }
    it { expect(questions_of_questionnaire_in_order.to_a).to match_array(questions) }
  end

  private

  def questions_of_questionnaire_in_order
    FetchQuestionsFromQuestionnaire.new(questionnaire).call
  end
end
