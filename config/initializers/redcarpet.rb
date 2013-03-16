class HTMLWithPrettify < Redcarpet::Render::HTML
  def block_code(code, language)
    return <<-EOD
      <pre class="prettyprint linenums #{language}">#{code}</pre>
    EOD
  end
end

