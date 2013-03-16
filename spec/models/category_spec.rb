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
    context 'with blank names' do
      it 'raises blank error' do
        expect { Category.create!(names: { en: '', ja: 'テスト' }) }.to raise_error
      end
    end
    context 'with invalid slug' do
      it 'raises invalid error' do
        expect { Category.create!(names: { en: 'test', ja: 'テスト' }, slug: 'テスト') }.to raise_error
      end
    end
  end

  describe '#destory' do
    let(:category) do
      category = Category.create!(names: { en: 'Test' })
      Post.create!(category: category, contents: [Content.create!(lang_id: Lang.primary.id, title: 'test', body: 'test')])
      category
    end
    it 'moves children to default' do
      posts = category.posts.to_a
      category.destroy!
      expect(posts.select { |p| p.category != Category.default }).to be_empty 
    end
  end

end
