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
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :name, :surname, presence: true

  validates :email, presence: true,
                    uniqueness: true,
                    format: {
                      with: URI::MailTo::EMAIL_REGEXP,
                      message: 'Wrong Email or Password. Please, try again.'
                    }

  # returns a list of all Tests that the User passes or has ever passed at this level of difficulty
  def test_by_level(level)
    Test.joins(:test_passages)
        .where('test_passages.user_id = :id AND tests.level = :level', id:, level:)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
