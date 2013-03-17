require 'spec_helper'

describe WelcomeController do

  describe 'search' do
    it 'shows matched posts' do
      get :search, { search_form: { q: 't' } }
      expect(assigns(:paginated_posts)).to eq([Post.first])
    end
  end

end
