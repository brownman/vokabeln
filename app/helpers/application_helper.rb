module ApplicationHelper
  def title page_title
    content_for(:title) { page_title }
  end
  
  def app_name
    "Vokabeln"
  end
  
  def flash_content
    result = ""
    [:success, :error, :notice].each do |category|
      if flash[category]
        result << "<div class='flash #{category.to_s}'>#{h flash[category]}</div>"
      end
    end
    result
  end
  
  def my_error_opts
    { :header_message => 'Error:', :header_tag => :h4, :message => '' }
  end
  
  BREADCRUMB_SEPARATOR = " / "
  def breadcrumb *pages
    pages.map do |page|
      if page.is_a? Array
        raw link_to *page
      else
        h page
      end
    end.join(BREADCRUMB_SEPARATOR)
  end
end
