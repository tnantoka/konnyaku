require 'spec_helper'

describe WelcomeController do

  describe 'search' do
    context 'single query' do
      it 'shows matched posts' do
        get :search, { search_form: { q: 't' } }
        expect(assigns(:paginated_posts)).to eq([Post.find_by(slug: 'slug')])
      end
    end
    context 'multiple queries' do
      it 'shows matched posts' do
        get :search, { search_form: { q: 't abc' } }
        expect(assigns(:paginated_posts)).to eq([Post.find_by(slug: 'abc'), Post.find_by(slug: 'slug')])
      end
    end
  end

end
