require 'spec_helper'

describe Post do

  describe '.create' do
    context 'with valid attributes' do
      it 'creates new post' do
        expect { Post.create!(category: Category.first, slug: 'test', contents: [Content.create!(lang_id: Lang.primary.id, title: 'test', body: 'test')]) }.to_not raise_error
      end
    end
    context 'with blank slug' do
      it 'creates new post' do
        expect { Post.create!(category: Category.first, contents_attributes: { '0' => { lang_id: Lang.primary.id, title: 'test', body: 'test' } }) }.to_not raise_error
      end
    end
    context 'with ininvalid attributes' do
      it 'raises invalid error' do
        expect { Post.create!(slug: 'テスト') }.to raise_error
      end
    end
  end

  describe '#content' do
    let(:post) do
      Post.first
    end
    it 'returns current_lang content' do
      expect(post.content(current_lang)).to eq(post.contents.find_by(lang_id: current_lang.id))
    end 
    it 'returns primary content' do
      lang = Lang.find_by(code: 'ja')
      expect(post.content(lang)).to eq(post.contents.find_by(lang_id: Lang.primary.id))
    end 
  end

  describe '#title' do
    let(:post) do
      Post.first
    end
    it 'returns current_lang title' do
      expect(post.title(current_lang)).to eq(post.contents.find_by(lang_id: current_lang.id).title)
    end 
    it 'returns primary title' do
      lang = Lang.find_by(code: 'ja')
      expect(post.title(lang)).to eq(post.contents.find_by(lang_id: Lang.primary.id).title)
    end 
  end

  describe '#html' do
    let(:post) do
      Post.first
    end
    it 'returns current_lang html' do
      expect(post.html(current_lang)).to eq(post.contents.find_by(lang_id: current_lang.id).html)
    end 
    it 'returns primary html' do
      lang = Lang.find_by(code: 'ja')
      expect(post.html(lang)).to eq(post.contents.find_by(lang_id: Lang.primary.id).html)
    end 
  end

  describe '#tags' do
    let(:post) do
      Post.first
    end
    it 'returns current_lang tags' do
      expect(post.tags(current_lang)).to eq(post.contents.find_by(lang_id: current_lang.id).tags)
    end 
    it 'returns primary tags' do
      lang = Lang.find_by(code: 'ja')
      expect(post.tags(lang)).to eq(post.contents.find_by(lang_id: Lang.primary.id).tags)
    end 
  end

  describe '#lang' do
    let(:post) do
      Post.first
    end
    it 'returns all langs of contents' do
      expect(post.langs).to eq([Lang.primary])
    end 
  end


  describe '.set_slug' do
    it 'sets title of first content' do
      post = Post.first
      post.slug = ''
      post.save!
      post.reload
      expect(post.slug).to eq(post.contents.first.title.parameterize)
    end
  end

  describe '.to_param' do
    it 'returns slug' do
      post = Post.first
      expect(post.to_param).to eq(post.slug)
    end
  end


end
