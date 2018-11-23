require "spec_helper"

RSpec.describe QuestionnaireReport do
  subject { described_class.new(questionnaire).call }

  let!(:questionnaire) { create(:questionnaire) }

  context "when the questionnaire is empty" do
    it { expect(subject.keys).to eq([questionnaire.name]) }
    it { expect(questionnaire_answers.keys).to match_array(%w[yes no not_answered]) }

    it { expect(questionnaire_answers["yes"]).to eq(0) }
    it { expect(questionnaire_answers["no"]).to eq(0) }
    it { expect(questionnaire_answers["not_answered"]).to eq(0) }
  end

  context "when the questionnaire has questions with no answers" do
    let(:questions) { create_list(:question, 4) }
    let!(:questionnaire_questions) do
      add_question_to_questionnaire(questionnaire, questions[0])
      add_question_to_questionnaire(questionnaire, questions[1])
      add_question_to_questionnaire(questionnaire, questions[2])
    end

    it { expect(subject.keys).to eq([questionnaire.name]) }
    it { expect(questionnaire_answers.keys).to match_array(%w[yes no not_answered]) }

    it { expect(questionnaire_answers["yes"]).to eq(0) }
    it { expect(questionnaire_answers["no"]).to eq(0) }
    it { expect(questionnaire_answers["not_answered"]).to eq(3) }
  end

  context "when the questionnaire has questions with answers" do
    let(:questions) { create_list(:question, 7) }
    let!(:questionnaire_questions) do
      add_question_to_questionnaire(questionnaire, questions[0])
      add_question_to_questionnaire(questionnaire, questions[1])
      add_question_to_questionnaire(questionnaire, questions[2])
      add_question_to_questionnaire(questionnaire, questions[3])
      add_question_to_questionnaire(questionnaire, questions[4])
      add_question_to_questionnaire(questionnaire, questions[5])
    end
    let!(:answers) do
      add_answer_to_question(questionnaire, questions[0], create(:answer, value: "yes"))
      add_answer_to_question(questionnaire, questions[3], create(:answer, value: "no"))
      add_answer_to_question(questionnaire, questions[4], create(:answer, value: "yes"))
    end

    it { expect(subject.keys).to eq([questionnaire.name]) }
    it { expect(questionnaire_answers.keys).to match_array(%w[yes no not_answered]) }

    it { expect(questionnaire_answers["yes"]).to eq(2) }
    it { expect(questionnaire_answers["no"]).to eq(1) }
    it { expect(questionnaire_answers["not_answered"]).to eq(3) }
  end

  private

  def add_question_to_questionnaire(questionnaire, question)
    AddQuestionToQuestionnaire.new(questionnaire: questionnaire, question: question).call
  end

  def add_answer_to_question(questionnaire, question, answer)
    AddAnswerToQuestion.new(questionnaire: questionnaire, question: question, answer: answer).call
  end

  def questionnaire_answers
    subject[questionnaire.name]
  end
end
