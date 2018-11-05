require "spec_helper"

RSpec.describe QuestionnaireReport do
  subject { described_class.new(questionnaire).call }

  let!(:questionnaire) { create(:questionnaire) }

  describe "returned hash structure" do
    it { expect(subject.keys).to eq([questionnaire.name]) }
    it { expect(questionnaire_answers.keys).to match_array(%w[yes no not_answered]) }
  end

  describe "returned hash's values" do
    it { expect(questionnaire_answers["yes"]).to eq(0) }
    it { expect(questionnaire_answers["no"]).to eq(0) }
    it { expect(questionnaire_answers["not_answered"]).to eq(0) }
  end

  context "with values" do
    let!(:questions) { create_list(:question, 4) }
    let!(:answers) do
      [
        create(:answer, value: "yes", question: questions[1]),
        create(:answer, value: "no", question: questions[2])
      ]
    end

    before do
      add_question_to_questionnaire(questionnaire, questions[0])
      add_question_to_questionnaire(questionnaire, questions[1])
      add_question_to_questionnaire(questionnaire, questions[2])
    end

    it { expect(questionnaire_answers["yes"]).to eq(1) }
    it { expect(questionnaire_answers["no"]).to eq(1) }
    it { expect(questionnaire_answers["not_answered"]).to eq(1) }
  end

  private

  def add_question_to_questionnaire(questionnaire, question)
    AddQuestionToQuestionnaire.new(questionnaire: questionnaire, question: question).call
  end

  def questionnaire_answers
    subject[questionnaire.name]
  end
end
