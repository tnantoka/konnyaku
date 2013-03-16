require 'spec_helper'

describe 'Welcome' do

  describe 'locale' do

    context 'with valid Accept-Language' do
      it 'uses "en" locale' do
        page.driver.header 'Accept-Language', 'en'
        visit root_path
        I18n.locale = 'en'
        expect(page).to have_content(I18n.t('sign_in'))
      end
      it 'uses "ja" locale' do
        page.driver.header 'Accept-Language', 'ja'
        visit root_path
        I18n.locale = 'ja'
        expect(page).to have_content(I18n.t('sign_in'))
      end
    end

    context 'with invalid Accept-Language' do
      it 'uses "en" locale' do
        page.driver.header 'Accept-Language', 'aa'
        visit root_path
        I18n.locale = 'en'
        expect(page).to have_content(I18n.t('sign_in'))
      end
    end
     
    context 'with valid params[:l]' do
      it 'uses "en" locale' do
        visit root_path(:l => 'en')
        I18n.locale = 'en'
        expect(page).to have_content(I18n.t('sign_in'))
      end
      it 'uses "ja" locale' do
        visit root_path(:l => 'ja')
        I18n.locale = 'ja'
        expect(page).to have_content(I18n.t('sign_in'))
      end
    end
 
    context 'with valid params[:l]' do
      it 'uses "en" locale' do
        visit root_path(:l => 'aa')
        I18n.locale = 'en'
        expect(page).to have_content(I18n.t('sign_in'))
      end
    end

  end

end
