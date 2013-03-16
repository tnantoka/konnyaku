module ApplicationHelper

  def site_name(plain: false)
    if plain 
      "#{@settings.site.title} #{@settings.site.dot} #{@settings.site.description}"
    else
      "#{@settings.site.title} <small>#{@settings.site.dot} #{@settings.site.description}</small>".html_safe
    end
  end

end
