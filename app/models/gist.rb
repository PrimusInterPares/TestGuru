class Gist < ApplicationRecord
  belongs_to :question, class_name: 'Question', foreign_key: :question_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id, optional: true

  validates :author_id, presence: true

  validates :question_id, presence: true

  validates :url, presence: true, uniqueness: true
end
