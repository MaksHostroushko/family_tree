module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Family tree"
    if page_title.empty?
      base_title
    else
      page_title
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def copyright_notice_year_range(start_year)
    start_year = start_year.to_i
    current_year = Time.now.year

    if current_year > start_year
      "#{start_year} - #{current_year}"
    else
      "#{current_year}"
    end
  end
end
