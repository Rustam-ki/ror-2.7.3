module ApplicationHelper

  FLASH_TYPES = {
    notice: 'alert-info',
    error: 'alert-warning',
    success: 'alert-success'
  }.freeze

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Click me', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    content_tag :div, flash[type], class: "alert #{FLASH_TYPES[type]}"
  end
end

