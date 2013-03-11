class Category < ActiveRecord::Base

  validates :slug, uniqueness: true, presence: true
  validates_each :slug do |record, attr, value|
    record.errors.add(attr, :invalid) if value.present? && value != value.parameterize 
  end
  validates_each :names do |record, attr, value|
    record.errors.add(attr, :invalid) if (value[Lang.first.code] || value[Lang.first.code.to_sym]).blank? 
  end

  before_validation :set_slug

  def name(lang)
    n = self.names[lang.code]
    n.present? ? n : self.names[Lang.first.code]
  end

  def to_param
    self.slug
  end

private

  def set_slug
    if self.slug.blank?
      self.slug = (self.names[Lang.first.code] || self.names[Lang.first.code.to_sym]).parameterize 
    end
  end
 
end
