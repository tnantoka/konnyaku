require 'spec_helper'

describe 'Comments' do

  def create_new_comment
    first(:link, Post.first.title(current_lang)).click()
    fill_in 'comment[author]', with: 'Test'
    fill_in 'comment[body]', with: 'Test'
    click_button('Create') 
  end

  before(:each) do
    visit root_path
  end

  context 'user' do

    describe 'create' do
      context 'with valid attributes' do
        it 'allows to comment' do  
          create_new_comment
          expect(page).to have_content('Test')
        end
      end
      context 'with blank attributes' do
        it 'disallow create new comment' do
          first(:link, Post.first.title(current_lang)).click()
          click_button('Create') 
          expect(page).to have_content('blank')
        end
      end
    end

    describe 'show' do
      it 'does not show admin links' do  
        create_new_comment
        expect(page).to_not have_content(I18n.t('delete'))
      end
    end
  end

  context 'admin' do
    before(:each) do
      sign_in
      first(:link, I18n.t('posts')).click
    end

    describe 'destroy' do
      it 'deletes post' do
        create_new_comment
        first(:link, I18n.t('delete')).click
        expect(Comment.all).to be_empty
      end
    end

   end

end


