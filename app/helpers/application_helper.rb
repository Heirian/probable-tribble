module ApplicationHelper
  def full_title(page_title = '')
    if page_title.empty?
      application_title
    else
      application_title + ' | ' + page_title
    end
  end

  def application_title
    'Gamarch'
  end

  def current_year
    Time.zone.today.year
  end
end
