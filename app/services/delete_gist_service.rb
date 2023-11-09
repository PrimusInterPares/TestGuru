class DeleteGistService
  def initialize(gist, client = nil)
    @gist = gist
    @client = client || GitHubClient.new
  end

  def call
    @client.delete_gist(gist_params)
    @success = true
  rescue Octokit::NotFound
    @success = false
  end

  private

  def gist_params
    {
      gist_id: @gist.github_gist_id
    }
  end
end
