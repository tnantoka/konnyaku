class ParameterizableValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) if value.present? && (value != value.parameterize || value.parameterize == 'new')
  end
end
