require 'spec_helper'

describe 'Sessions' do

  describe 'sign_in' do

    context 'with valid credentials' do
      before(:each) do
        sign_in
      end
      it 'allows user to sign in' do
        expect(page).to have_content(I18n.t('flash.sessions.sign_in'))  
      end
      it 'redirects to dashboard path' do
        expect(current_path).to eq(dashboard_path)
      end
      it 'shows username' do
        expect(page).to have_content(Settings.admin.username)  
      end
    end

    context 'with invalid credentials' do
      before(:each) do
        sign_in(username: 'user', password: 'pass')
      end
      it 'disallows user to sign in' do
        expect(page).to have_content(I18n.t('flash.sessions.invalid'))  
      end
    end

    context 'not signed in' do
      before(:each) do
        visit dashboard_path
      end
      it 'disallows user to access' do
        expect(page).to have_content(I18n.t('flash.sessions.unauthenticated'))  
      end
      it 'redirects to root path' do
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe 'sign_in' do
    before(:each) do
      sign_in
      click_link I18n.t('sign_out')
    end
    it 'allows user to sign out' do
      expect(page).to have_content(I18n.t('flash.sessions.sign_out'))  
    end
    it 'redirects to root path' do
      expect(current_path).to eq(root_path)
    end
  end

end
