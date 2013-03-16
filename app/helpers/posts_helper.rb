module PostsHelper

  def lang_list(post, labeled: true)
    list = ''
    post.langs.each do |lang|
      label = labeled ? "<span class=\"label\">#{t(lang.code)}</span>".html_safe : t(lang.code)
      list << "<li class=\"#{lang == current_lang ? 'active' : ''}\">#{link_to(label, post_path(post, l: lang.code))}</li>"
    end
    return list.html_safe
  end

  def tag_list(post)
    list = ''
    post.tags(current_lang).each do |tag|
      label = "<span class=\"label\">#{tag}</span>".html_safe
      list << "<li>#{link_to(label, '#')}</li>"
    end
    return list.html_safe
  end

  def time_ago(date)
    return "<span title=\"#{l(date)}\">#{time_ago_in_words(date)}#{t(:ago)}</span>".html_safe
  end


end
