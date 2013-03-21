class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :lang

  validates_presence_of :post_id, :lang_id, :author
  validates :body, uniqueness: true, presence: true

  before_save :render

  scope :current, -> lang { where(lang_id: lang.id) }

  scope :index, -> lang { 
    where(lang_id: lang.id)
    .order('created_at DESC')
  } 

private
  def render
    renderer = HTMLWithPrettify.new(
      filter_html: true,
      no_images: true,
      no_styles: true,
      safe_links_only: true,
      hard_wrap: true,
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
