module QuestionsHelper
  def question_header(test, question)
    if question.persisted?
      "Edit question in \"#{question.test.title}\" test"
    else
      "Create new question into \"#{test.title}\" test"
    end
  end
end
