class Question < ApplicationRecord
  belongs_to :questionnaire
  has_one :answer
end
