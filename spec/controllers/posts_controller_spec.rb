require 'spec_helper'

describe PostsController do

  def valid_session
    { username: Settings.get(Lang.primary.code).admin.username }
  end

  describe 'redirect_to_primary' do
    it 'redirects to primary lang' do
      I18n::available_locales += [:ch]
      Lang.create!(code: 'ch')
      get :show, { id: Post.first.slug, l: 'ch' }, valid_session
      expect(response).to redirect_to(post_url(Post.first, l: Lang.primary.code))
    end
  end

  describe 'markdown' do
    it 'returns to rendered html' do
      post :markdown, { body: '#title' }, valid_session
      expect(response.body).to eq("<h1 id=\"toc_0\">title</h1>\n")
    end
  end

end
