module ApplicationHelper
  ALERTS = {
    notice: 'info',
    error: 'danger',
    success: 'success',
    alert: 'warning'
  }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_alert(key)
    ALERTS[key.to_sym] if flash[key]
  end
end
