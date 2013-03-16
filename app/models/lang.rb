class Lang < ActiveRecord::Base

  has_many :contents

  validates :code, presence: true, uniqueness: true
  validates_each :code do |record, attr, value|
    record.errors.add(attr, :invalid) unless I18n::available_locales.include? value.to_sym 
  end

  def self.primary
    self.first
  end
 
end
