require 'spec_helper'

describe 'Posts' do

  def create_new_post
    first(:link, I18n.t('new_post')).click()
    select(Category.default.name(current_lang)) 
    fill_in 'post[contents_attributes][0][title]', with: 'Test'
    fill_in 'post[contents_attributes][0][body]', with: 'Test'
    first(:button, 'Create').click()
  end

  before(:each) do
    visit root_path
  end

  context 'user' do

    describe 'index' do
      it 'lists posts' do  
        expect(page).to have_content(Post.first.title(current_lang))
      end
      it 'does not show admin links' do  
        expect(page).to_not have_content(I18n.t('new_post'))
      end
      it 'returns atom feed' do
        visit posts_path(format: :atom) 
        expect(page).to have_content(Post.last.created_at.iso8601)
      end
    end
 
    describe 'show' do
      before(:each) do
        first(:link, Post.first.title(current_lang)).click()
      end
      it 'shows post title' do  
        within 'h1' do
          expect(page).to have_content(Post.first.title(current_lang))
        end
      end
    end

    describe 'edit' do
      it 'disallows access' do
        visit edit_post_path(Post.first)
        expect(page).to have_content(I18n.t('flash.sessions.unauthenticated'))
      end
    end

    describe 'new' do
      it 'disallows access' do
        visit new_post_path
        expect(page).to have_content(I18n.t('flash.sessions.unauthenticated'))
      end
    end
   end

  context 'admin' do
    before(:each) do
      sign_in
      first(:link, I18n.t('posts')).click
    end

    describe 'index' do
      it 'lists posts' do  
        expect(page).to have_content(Post.first.title(current_lang))
      end
    end

    describe 'create' do
      context 'with valid attributes' do
        it 'creates new post' do
          create_new_post
          expect(Post.last.title(current_lang)).to eq('Test')
        end
      end
      context 'with blank attributes' do
        it 'disallow create new post' do
          first(:link, I18n.t('new_post')).click()
          first(:button, 'Create').click()
          expect(page).to have_content('blank')
        end
      end
    end

    describe 'update' do
      context 'with valid attributes' do
        it 'updates post' do
          first(:link, I18n.t('edit')).click
          fill_in 'post[contents_attributes][0][title]', with: 'Edit'
          first(:button, 'Update').click()
          expect(Post.first.title(current_lang)).to eq('Edit')
        end
      end
      context 'with blank attributes' do
        it 'disallow update post' do
          first(:link, I18n.t('edit')).click
          fill_in 'post[contents_attributes][0][title]', with: ''
          first(:button, 'Update').click()
          expect(page).to have_content('blank')
        end
      end
    end
    
    describe 'destroy' do
      it 'deletes post' do
        create_new_post
        first(:link, I18n.t('posts')).click
        first(:link, I18n.t('delete')).click
        expect(Post.last.title(current_lang)).to eq('Title')
      end
    end

   end

end


