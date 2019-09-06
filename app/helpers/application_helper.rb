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

  def devise_error_messages!
   return '' if resource.errors.empty?

   messages = resource.errors.full_messages.map do |msg|
     content_tag(:li, msg)
   end .join
   html <<-HTML
   <div class="alert alert-error allert-danger">
     <a href='#' class='close' data-dismiss='alert' &#215;></a>
     <%= content_tag :div, msg if msg.is_a?(String) %>
   </div>
   HTML
   html.html_safe
 end
end
