module ApplicationHelper

  def site_name(plain: false)
    description = @settings.site.description.blank? ? "" : "#{@settings.site.dot} #{@settings.site.description}"
    if plain 
      "#{@settings.site.title} #{description}"
    else
      "#{@settings.site.title} <small>#{description}</small>".html_safe
    end
  end

  def aside
    if @settings.view.aside_stacked.present? 
      return 'shared/aside_stacked'
    else 
      return 'shared/aside'
    end
  end

  def gravatar(email)
    return '' if email.blank?
    md5 = Digest::MD5.hexdigest(email)
    image_tag("http://www.gravatar.com/avatar/#{md5}?s=48", alt: '')
  end

  def author
    img = gravatar(@settings.admin.email) 
    "#{img} #{@settings.admin.name}".html_safe
  end

end
