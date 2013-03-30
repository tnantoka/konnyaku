require 'spec_helper'

describe 'Categories' do

  def create_new_category
    click_link(I18n.t('new_category'))
    fill_in 'category[names][en]', with: 'Test'
    click_button('Create') 
  end

  before(:each) do
    visit root_path
  end

  context 'user' do

    describe 'index' do
      before(:each) do
        visit categories_path
      end
      it 'lists categories' do  
        expect(page).to have_content(Category.first.name(current_lang))
      end
      it 'does not show admin links' do  
        expect(page).to_not have_content(I18n.t('new_category'))
      end
    end
 
    describe 'show' do
      before(:each) do
        first(:link, Category.first.name(current_lang)).click()
      end
      it 'shows category name' do  
        within 'h1' do
          expect(page).to have_content(Category.first.name(current_lang))
        end
      end
      it 'shows entries' do
        expect(page).to have_content(Category.first.posts.first.title(current_lang))
      end
    end

    describe 'edit' do
      it 'disallows access' do
        visit edit_category_path(Category.first)
        expect(page).to have_content(I18n.t('flash.sessions.unauthenticated'))
      end
    end

    describe 'new' do
      it 'disallows access' do
        visit new_category_path
        expect(page).to have_content(I18n.t('flash.sessions.unauthenticated'))
      end
    end
   end

  context 'admin' do
    before(:each) do
      sign_in
      first(:link, I18n.t('categories')).click
    end

    describe 'index' do
      it 'lists categories' do  
        expect(page).to have_content(Category.first.name(current_lang))
      end
    end

    describe 'create' do
      context 'with valid attributes' do
        it 'creates new category' do
          create_new_category
          expect(Category.last.names['en']).to eq('Test')
        end
      end
      context 'with blank attributes' do
        it 'disallow create new category' do
          click_link(I18n.t('new_category'))
          click_button('Create') 
          expect(page).to have_content('blank')
        end
      end
    end

    describe 'update' do
      context 'with valid attributes' do
        it 'updates category' do
          first(:link, I18n.t('edit')).click
          fill_in 'category[names][en]', with: 'Edit'
          click_button('Update') 
          expect(Category.first.names['en']).to eq('Edit')
        end
      end
      context 'with blank attributes' do
        it 'disallow update category' do
          first(:link, I18n.t('edit')).click
          fill_in 'category[names][en]', with: ''
          click_button('Update') 
          expect(page).to have_content('blank')
        end
      end
    end
    
    describe 'destroy' do
      it 'deletes category' do
        create_new_category
        first(:link, I18n.t('delete')).click
        expect(Category.last.names['en']).to eq('Uncategorized')
      end
    end

   end

end


