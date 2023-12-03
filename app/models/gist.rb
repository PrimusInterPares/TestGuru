# frozen_string_literal: true

class Gist < ApplicationRecord
  belongs_to :question, class_name: 'Question', foreign_key: :question_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id, optional: true

  validates :author_id, :question_id, presence: true

  validates :url, :github_gist_id, presence: true, uniqueness: true
end
