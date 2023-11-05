class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'.freeze
  ACCESS_TOKEN = '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'.freeze
  # ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
