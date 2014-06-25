class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :parent
  has_many :answers
  belongs_to :category
end
