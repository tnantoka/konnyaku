require 'spec_helper'

describe Comment do

  describe '.create' do
    context 'with valid attributes' do
      it 'creates new post' do
        expect { Comment.create!(post: Post.first, lang: Lang.primary, author: 'test', body: 'test') }.to_not raise_error
      end
    end
    context 'with ininvalid attributes' do
      it 'raises invalid error' do
        expect { Comment.create!() }.to raise_error
      end
    end
  end

  describe '#render' do
    it 'renders html' do
      Comment.create!(post: Post.first, lang: Lang.primary, author: 'test', body: '#test') 
      expect(Comment.last.html).to eq("<h1>test</h1>\n")
    end
  end
end
