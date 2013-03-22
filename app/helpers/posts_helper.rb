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
      list << "<li>#{link_to(label, tag_path(tag))}</li>"
    end
    return list.html_safe
  end

  def time_ago(date, plain: false)
    if plain
      return "#{time_ago_in_words(date)}#{t(:ago)}"
    else
      return "<span title=\"#{l(date)}\">#{time_ago_in_words(date)}#{t(:ago)}</span>".html_safe
    end
  end

  def truncate(text)
    return truncate_html(text, length: @settings.view.truncate).html_safe 
  end

  def highlight_queries(text)
    return highlight(text, Post.split_query(@search_form.q))
  end

end
