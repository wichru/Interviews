require "spec_helper"

RSpec.describe FetchQuestionsFromQuestionnaire do
  subject { described_class.new(questionnaire).call }

  let!(:questionnaire) { create(:questionnaire) }

  it { expect(subject.count).to eq(0) }

  context "with questions in order" do
    let!(:questions) { create_list(:question, 4)}
    let!(:questions_in_questionnaires) do
      add_question_to_questionnaire(questionnaire, questions[0], 0)
      add_question_to_questionnaire(questionnaire, questions[1], 1)
      add_question_to_questionnaire(questionnaire, questions[2], 2)
    end

    it { expect(subject).to eq([questions[0], questions[1], questions[2]]) }

    context "and the ordering is mixed" do
      let!(:questions_in_questionnaires) do
        add_question_to_questionnaire(questionnaire, questions[0], 0)
        add_question_to_questionnaire(questionnaire, questions[1], 1)
        add_question_to_questionnaire(questionnaire, questions[2], 0)
        add_question_to_questionnaire(questionnaire, questions[3], 1)
      end

      it { expect(subject).to eq([questions[2], questions[3], questions[0], questions[1]]) }
    end
  end

  private

  def add_question_to_questionnaire(questionnaire, question, place)
    AddQuestionToQuestionnaire.new(questionnaire: questionnaire, question: question, place: place).call
  end
end
