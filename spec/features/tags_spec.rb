require 'spec_helper'

describe 'Posts' do

  before(:each) do
    visit root_path
  end

  describe 'index' do
    it 'lists tags' do  
      click_link I18n.t('tags')
      expect(page).to have_content('tag (1)')
    end
  end

  describe 'show' do
    before(:each) do
      first(:link, 'tag (1)').click()
    end
    it 'shows post title' do  
      within 'h2' do
        expect(page).to have_content(Post.first.title(current_lang))
      end
    end
  end

end


