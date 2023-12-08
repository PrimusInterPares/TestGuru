# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable,
         :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id
  has_many :authored_gists, class_name: 'Gist', foreign_key: :author_id

  validates :name, :surname, presence: true

  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: 'Email template: template@example.com'
                    }

  # returns a list of all Tests that the User passes or has ever passed at this level of difficulty
  def test_by_level(level)
    Test.joins(:test_passages)
        .where('test_passages.user_id = :id AND tests.level = :level', id:, level:)
  end

  # returns the last TestPassage with the Test specified
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
