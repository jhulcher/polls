class AnswerChoice < ActiveRecord::Base
  has_many :responses,
  foreign_key: :answer_choice_id,
  primary_key: :id,
  class_name: "Response"

  belongs_to :questions,
  foreign_key: :question_id,
  primary_key: :id,
  class_name: "Question"

  validates :text, :question_id, presence: true
end
