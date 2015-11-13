class Question < ActiveRecord::Base
  belongs_to :polls,
  foreign_key: :poll_id,
  primary_key: :id,
  class_name: "Poll"

  has_many :answer_choices,
  foreign_key: :question_id,
  primary_key: :id,
  class_name: "AnswerChoice"

  has_many :responses,
  through: :answer_choices,
  source: :responses

  validates :text, :poll_id, presence: true
end
