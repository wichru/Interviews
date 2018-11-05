require "spec_helper"

RSpec.describe RemoveQuestionFromQuestionnaire do
  subject { described_class.new(questionnaire: questionnaire, question: removed_question).call }

  let!(:questionnaire) { create(:questionnaire) }

  context "when questionnaire has questions" do
    let!(:questions) { create_list(:question, 4) }
    let!(:answers) do
      [
        create(:answer, value: "yes"),
        create(:answer, value: "no")
      ]
    end

    before do
      add_question_to_questionnaire(questionnaire, questions[0])
      add_question_to_questionnaire(questionnaire, questions[1])
      add_question_to_questionnaire(questionnaire, questions[2])
    end

    context "and we're removing the first question" do
      let(:removed_question) { questions[0] }
      before { subject }
      it { expect(questions_of_questionnaire.to_a).to eq([questions[1], questions[2]]) }
    end

    context "and we're removing the question from the second place" do
      let(:removed_question) { questions[1] }
      before { subject }
      it { expect(questions_of_questionnaire.to_a).to eq([questions[0], questions[2]]) }
    end
  end

  context "when questionnaire doesn't have the given question" do
    let(:removed_question) { create(:question) }
    it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
  end

  private

  private

  def add_question_to_questionnaire(questionnaire, question)
    AddQuestionToQuestionnaire.new(questionnaire: questionnaire, question: question).call
  end

  def questions_of_questionnaire
    FetchQuestionsFromQuestionnaire.new(questionnaire).call
  end
end
