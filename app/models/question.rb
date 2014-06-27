class Question < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks
  belongs_to :user
  has_many :comments, as: :parent
  has_many :answers
  belongs_to :category

  validates_presence_of :title, :content, :user_id, :category_id
end
