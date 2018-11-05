require "spec_helper"

RSpec.describe FetchQuestionsFromQuestionnaire do
  subject { described_class.new(questionnaire).call }

  let!(:questionnaire) { create(:questionnaire) }

  it { expect(subject.count).to eq(0) }

  context "with questions" do
    let!(:questions) { create_list(:question, 3)}
    let!(:questions_in_questionnaires) do
      add_question_to_questionnaire(questionnaire, questions[0])
      add_question_to_questionnaire(questionnaire, questions[1])
      add_question_to_questionnaire(questionnaire, questions[2])
    end

    it { expect(subject).to match_array(questions) }
  end

  private

  def add_question_to_questionnaire(questionnaire, question)
    AddQuestionToQuestionnaire.new(questionnaire: questionnaire, question: question).call
  end
end
