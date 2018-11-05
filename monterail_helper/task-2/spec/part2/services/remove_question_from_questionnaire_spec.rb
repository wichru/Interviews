require "spec_helper"

RSpec.describe RemoveQuestionFromQuestionnaire do
  subject { described_class.new(questionnaire: questionnaire, question: removed_question).call }

  let!(:questionnaire) { create(:questionnaire) }

  context "when questionnaire has questions" do
    let!(:questions) { create_list(:question, 4) }
    let!(:questions_in_questionnaires) do
      add_question_to_questionnaire(questionnaire, questions[0], 0)
      add_question_to_questionnaire(questionnaire, questions[1], 1)
      add_question_to_questionnaire(questionnaire, questions[2], 2)
    end

    context "and we're removing the first question" do
      let(:removed_question) { questions[0] }
      before { subject }
      it { expect(questions_of_questionnaire_in_order.to_a).to eq([questions[1], questions[2]]) }
    end

    context "and we're removing the question from the second place" do
      let(:removed_question) { questions[1] }
      before { subject }
      it { expect(questions_of_questionnaire_in_order.to_a).to eq([questions[0], questions[2]]) }
    end
  end

  context "when questionnaire doesn't have the given question" do
    let(:removed_question) { create(:question) }
    it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
  end

  private

  def add_question_to_questionnaire(questionnaire, question, place)
    AddQuestionToQuestionnaire.new(questionnaire: questionnaire, question: question, place: place).call
  end

  def questions_of_questionnaire_in_order
    FetchQuestionsFromQuestionnaire.new(questionnaire).call
  end
end
