module VersionsHelper

  def diff(version, attr)
    current = version.reify[attr]
    prev = version.previous.present? && version.previous.reify.present? ? version.previous.reify[attr] : ''
    diff = Diffy::Diff.new(prev, current, include_diff_info: false, include_plus_and_minus_in_html: true).to_s(:html)
    diff.html_safe
  end

end
