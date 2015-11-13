class User < ActiveRecord::Base
  has_many :polls,
  foreign_key: :author_id,
  primary_key: :id,
  class_name: "Poll"

  has_many :responses,
  foreign_key: :respondent_id,
  primary_key: :id,
  class_name: "Response"

  validates :user_name, presence: true, uniqueness: true
end
