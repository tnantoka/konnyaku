class Content < ActiveRecord::Base

  belongs_to :post
  belongs_to :lang

  validates :title, uniqueness: { scode: :lang_id }, allow_blank: true
  validates_presence_of :lang_id
  validate :title_of_primary_lang_cannot_be_blank, :body_of_primary_lang_cannot_be_blank

  before_validation :render
  default_scope -> { self.order(:lang_id) }

  def title_of_primary_lang_cannot_be_blank
    self.errors.add(:title, :blank) if self.lang == Lang.primary && self.title.blank?
  end

  def body_of_primary_lang_cannot_be_blank
    self.errors.add(:body, :blank) if self.lang == Lang.primary && (self.body.blank? || self.html.blank?)
  end

  def render
    return if self.body.blank?

    renderer = HTMLWithPrettify.new(
      safe_links_only: true,
      with_toc_data: true,
      link_attributes: { target: '_blank' }
    )
    extensions = {
      fenced_code_blocks: true,
      autolink: true,
    }
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    self.html = markdown.render(self.body)
  end


end
