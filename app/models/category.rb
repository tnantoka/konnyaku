class Category < ActiveRecord::Base

  has_many :posts

  validates :slug, uniqueness: true, presence: true, parameterizable: true
  validate :name_of_primary_lang_cannot_be_blank
  before_validation :set_slug
  before_destroy :move_to_default

  def name(lang)
    n = self.names[lang.code]
    n.present? ? n : self.names[Lang.primary.code]
  end

  def to_param
    "#{self.slug}"
  end

  def self.default
    self.first
  end

private

  def set_slug
    if self.slug.blank?
      code = Lang.primary.code
      self.slug = (self.names[code] || self.names[code.to_sym]).parameterize 
    end
  end

  def name_of_primary_lang_cannot_be_blank
    code = Lang.primary.code
    self.errors.add(:names, :blank) if (self.names[code] || self.names[code.to_sym]).blank? 
  end

  def move_to_default
    self.posts.each do |post|
      post.category = Category.default 
      post.save!
    end
  end

end
