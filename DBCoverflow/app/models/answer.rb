class Answer < ActiveRecord::Base
  has_many :comments, as: :parent
  belongs_to :user


end
