require 'spec_helper'

describe 'Versions' do

  before(:each) do
    sign_in
    first(:link, I18n.t('posts')).click
    first(:link, I18n.t('edit')).click
    fill_in 'post[contents_attributes][0][title]', with: 'Edit'
    first(:button, 'Update').click()
    expect(Post.first.title(current_lang)).to eq('Edit')
  end

  describe 'index' do
    it 'shows histories' do
      first(:link, 'Edit').click
      click_link(I18n.t('histories'))
      expect(page).to have_content("#{I18n.t('version')} 1")
    end
  end

  describe 'show' do
    it 'shows histories' do
      first(:link, 'Edit').click
      click_link(I18n.t('histories'))
      click_link("#{I18n.t('version')} 1")
      expect(page).to have_content(Post.first.versions(current_lang).last.reify.title)
    end
  end
   
end


