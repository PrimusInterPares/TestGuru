class GistQuestionService
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize(question, client: client_octokit)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.desc', title: @test.title),
      files: {
        ' test-guru-question.txt ': {
          content: gist_content
        }
      },
      public: true
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def client_octokit
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
