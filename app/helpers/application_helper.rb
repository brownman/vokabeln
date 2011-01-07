module ApplicationHelper
  def title
    @title || "Vokabeln"
  end
  
  def app_name
    "Vokabeln"
  end
  
  def flash_content
    result = ""
    [:error, :notice].each do |category|
      if flash[category]
        result << "<div class='flash #{category.to_s}'>#{flash[category]}</div>"
      end
    end
    result
  end
  
  def my_error_opts
    { :header_message => 'Error:', :header_tag => :h4, :message => '' }
  end
end