class Response < ActiveRecord::Base

  belongs_to :user,
  primary_key: :id,
  foreign_key: :respondent_id,
  class_name: "User"

  belongs_to :answer_choices,
  primary_key: :id,
  foreign_key: :answer_choice_id,
  class_name: "AnswerChoice"

  has_one :question,
  through: :answer_choices,
  source: :questions

  validates :answer_choice_id, :respondent_id, presence: true
  validate :respondent_has_not_already_answered_question

  def respondent_has_not_already_answered_question
    if sibling_responses.exists?(respondent_id: respondent_id)
      errors[:user] << "Already responded!"
    end
  end

  def sibling_responses
    if self.id.nil?
      question.responses
    else
      question.responses.where("responses.id != ?", self.id)
    end

  end

end
