module ApplicationHelper
  def full_title(page_title = '')
    if page_title.empty?
      application_title
    else
      application_title + ' | ' + page_title
    end
  end

  def application_title
    ENV['APPLICATION_TITLE'] || 'Gamarch'
  end

  def current_year
    Time.zone.today.year
  end

  def available_locales
    I18n.available_locales
  end
end
