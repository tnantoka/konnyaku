require 'spec_helper'

describe CategoriesController do

  def valid_session
    { username: Settings.admin.username }
  end

  describe 'destroy' do
    context 'first category' do
      before(:each) do
        delete :destroy, { id: Category.first }, valid_session
      end
      it 'redirects root_url' do
        expect(response).to redirect_to(categories_url)
      end
      it 'does not delete category' do
        expect(Category.first.slug).to eq('uncategorized')
      end
    end
  end

end
