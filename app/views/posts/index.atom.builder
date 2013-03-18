atom_feed do |feed|
  feed.title(@settings.site.title)

  feed.updated(@recent_posts[0].created_at) if @posts.present?

  @recent_posts.each do |post|
    feed.entry(post) do |entry|
      entry.title(post.title(current_lang))
      entry.content(truncate_body(post), :type => 'html')

      entry.author do |author|
        author.name(@settings.admin.name)
      end
    end
  end

end
