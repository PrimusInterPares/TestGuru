class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, class_name: 'Gist', foreign_key: :question_id, dependent: :destroy

  validates :body, presence: true
end
