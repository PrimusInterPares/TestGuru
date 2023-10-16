module QuestionsHelper
  def question_header(test, question)
    if question.persisted?
      "Edit question in \"#{question.test.title}\""
    else
      "Create new question into \"#{test.title}\""
    end
  end
end
