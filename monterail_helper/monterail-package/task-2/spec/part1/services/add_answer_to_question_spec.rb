require "spec_helper"

RSpec.describe AddAnswerToQuestion do
  subject { described_class.new(questionnaire: questionnaire, question: question, answer: answer).call }

  let(:questionnaire) { create(:questionnaire) }
  let(:question) { create(:question) }
  let(:answer) { create(:answer) }

  context "when question is linked to the questionnaire" do
    before { add_question_to_questionnaire(questionnaire, question) }
    it { expect { subject }.not_to raise_error }
  end

  context "when question is not linked to the questionnaire" do
    it { expect { subject }.to raise_error(StandardError) }
  end

  def add_question_to_questionnaire(questionnaire, question)
    AddQuestionToQuestionnaire.new(questionnaire: questionnaire, question: question).call
  end
end
