require 'spec_helper'

describe Lang do

  describe '.create' do
    context 'with valid code' do
      after(:each) do
        I18n::available_locales = [:en, :ja]
      end
      it 'creates new lang' do
        I18n::available_locales = [:ch]
        expect { Lang.create!(id: 3, code: 'ch') }.to_not raise_error
      end
    end
    context 'with invalid code' do
      it 'raises invalid error' do
        expect { Lang.create!(id: 3, code: 'aa') }.to raise_error
      end
    end
    context 'with duplicated code' do
      it 'raises invalid error' do
        expect { Lang.create!(id: 3, code: 'ja') }.to raise_error
      end
    end
  end

end
