class Answer < ApplicationRecord
  belongs_to :question

  validates :value, inclusion: { in: ['yes', 'no'] }, presence: true
end
