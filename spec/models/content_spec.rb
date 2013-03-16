require 'spec_helper'

describe Content do

  describe '.create' do
    context 'with valid attributes' do
      it 'creates new content' do
        expect { Content.create!(lang: Lang.primary, title: 'Test', body: 'Test', tags: ['tag']) }.to_not raise_error
      end
    end
    context 'with blank attributes and primary lang' do
      it 'creates new content' do
        expect { Content.create!(lang: Lang.primary, title: '', body: '') }.to raise_error
      end
    end
    context 'with blank attributes and not primary lang' do
      it 'creates new content' do
        expect { Content.create!(lang: Lang.find_by(code: 'ja'), title: '', body: '') }.to_not raise_error
      end
    end
    context 'with duplicated title' do
      it 'raises taken error' do
        expect { 
          Content.create!(lang: Lang.primary, title: 'Test', body: 'Test', tags: ['tag'])
          Content.create!(lang: Lang.primary, title: 'Test', body: 'Test', tags: ['tag'])
        }.to raise_error
      end
    end
    context 'with ininvalid attributes' do
      it 'raises invalid error' do
        expect { Content.create!({}) }.to raise_error
      end
    end
  end

end
