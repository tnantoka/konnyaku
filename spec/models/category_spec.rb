require 'spec_helper'

describe Category do

  describe '.create' do
    context 'with valid names' do
      it 'creates new category' do
        expect { Category.create!(names: { en: 'Test', ja: 'テスト' }) }.to_not raise_error
      end
    end
    context 'with valid names and slug' do
      let(:category) do
        Category.new(names: { en: 'Test', ja: 'テスト' }, slug: 't')
      end
      it 'creates new category' do
        expect { category.save! }.to_not raise_error
      end
    end
    context 'with invalid names' do
      it 'raises invalid error' do
        expect { Category.create!(names: { en: '', ja: 'テスト' }) }.to raise_error
      end
    end
    context 'with invalid slug' do
      it 'raises invalid error' do
        expect { Category.create!(names: { en: 'test', ja: 'テスト' }, slug: 'テスト') }.to raise_error
      end
    end
  end

end
