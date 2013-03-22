require 'spec_helper'

describe 'Uploads' do

  def create_new_upload
    first(:link, I18n.t('uploads')).click()
    find('#upload_file').set("#{Rails.root}/app/assets/images/rails.png")
    click_button 'Create'
  end

  context 'user' do
    describe 'index' do
      it 'does not show upload form' do  
        visit uploads_path
        expect(page).to_not have_css('#upload_file')
      end
    end
  end
 
  context 'admin' do
    before (:each) do
      sign_in
    end
    describe 'create' do
      context 'valid file' do
        it 'creates new upload' do
          create_new_upload
          page.should have_content('rails.png')
        end
      end
      context 'blank file' do
        it 'disallows create new upload' do
          first(:link, I18n.t('uploads')).click()
          click_button 'Create'
          page.should have_content('blank')
        end
      end
    end
    describe 'destroy' do
      it 'deletes upload' do
        create_new_upload
        first(:link, I18n.t('delete')).click
        expect(page).to_not have_content('rails.png')
      end
    end
    describe 'disabled' do
      it 'disallows access' do
        Settings.en.admin[:upload] = false
        visit uploads_path
        expect(page).to have_content(I18n.t('flash.uploads.disabled'))
        Settings.en.admin[:upload] = true
      end
    end
  end

end

