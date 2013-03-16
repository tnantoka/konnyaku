class ParameterizableValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attr, :invalid) if value.present? && value != value.parameterize 
  end
end
