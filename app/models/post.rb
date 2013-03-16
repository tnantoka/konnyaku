class Post < ActiveRecord::Base

  belongs_to :category
  has_many :contents, dependent: :destroy

  accepts_nested_attributes_for :contents

  validates_presence_of :category_id
  validates :slug, uniqueness: true, presence: true, parameterizable: true
  validate :contents_cannot_be_blank

  before_validation :set_slug

  scope :index, -> lang { 
    where('contents.lang_id = ?', lang.id)
    .where('contents.title != ?', '')
    .where('contents.body != ?', '')
    .order('created_at DESC')
    .joins(:contents) 
  } 

  def content(lang)
    current = self.contents.find_by(lang_id: lang.id)
    primary = self.contents.find_by(lang_id: Lang.primary.id)
    if current.try(:title).blank? || current.try(:body).blank?
      return primary 
    else
      return current
    end
  end

  def title(lang)
    current_or_primary(lang, :title)
  end

  def html(lang)
    current_or_primary(lang, :html)
  end

  def tags(lang)
    current_or_primary(lang, :tags)
  end

  def langs
    self.contents.where.not(title: '').where.not(body: '').order(:lang_id).map { |c| c.lang }
  end

  def to_param
    self.slug
  end

private

  def current_or_primary(lang, attr)
    self.contents.find_by(lang_id: lang.id).try(attr).presence || self.contents.find_by(lang_id: Lang.primary.id).try(attr)
  end

  def set_slug
    if self.slug.blank?
      self.slug = self.contents.first.title.to_s.parameterize 
    end
  end

   def contents_cannot_be_blank
    self.errors.add(:contents, :blank) if self.contents.blank?
  end


end
