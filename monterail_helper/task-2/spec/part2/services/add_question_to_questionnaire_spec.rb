require "spec_helper"

RSpec.describe AddQuestionToQuestionnaire do
  let(:questionnaire) { create(:questionnaire) }
  let(:added_question) { create(:question) }
  let(:place) { 0 }

  context "when adding one question to an empty questionnaire" do
    subject { described_class.new(questionnaire: questionnaire, question: added_question, place: place).call }

    context "and the place is a positive number" do
      before { subject }
      it { expect(questions_of_questionnaire_in_order.to_a).to eq([added_question]) }
    end

    context "and the place is not given" do
      let(:place) { nil }

      before { subject }
      it { expect(questions_of_questionnaire_in_order.to_a).to eq([added_question]) }
    end

    context "and the place is a negative number" do
      let(:place) { -1 }

      it { expect { subject }.to raise_error(ActiveRecord::ActiveRecordError) }
    end

    context "and the place has letters" do
      let(:place) { "w11" }

      it { expect { subject }.to raise_error(ActiveRecord::ActiveRecordError) }
    end
  end

  context "when adding multiple questions to a questionnaire" do
    let(:questions) { create_list(:question, 4) }
    subject do
      described_class.new(questionnaire: questionnaire, question: questions[0]).call
      described_class.new(questionnaire: questionnaire, question: questions[1], place: 1).call
      described_class.new(questionnaire: questionnaire, question: questions[2], place: 0).call
      described_class.new(questionnaire: questionnaire, question: questions[3]).call
    end

    before { subject }
    it { expect(questions_of_questionnaire_in_order.to_a).to eq([questions[2], questions[0], questions[1], questions[3]]) }
  end

  private

  def questions_of_questionnaire_in_order
    FetchQuestionsFromQuestionnaire.new(questionnaire).call
  end
end
