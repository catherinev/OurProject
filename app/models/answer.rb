class Answer < ActiveRecord::Base
  has_many :comments, as: :parent
  belongs_to :user
  belongs_to :question

  validates :question_id, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
