module QuestionsHelper
  def question_header(test, question)
    if question.persisted?
      t('.header_edit_question', title: question.test.title)
    else
      t('.header_create_new_question', title: test.title)
    end
  end
end
