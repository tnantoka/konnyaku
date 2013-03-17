class WelcomeController < ApplicationController

  before_action :sign_in_required, only: [:dashboard]

  def index
    @paginated_posts = @posts.page(params[:p]).per(@settings.post.pagination.recent)
  end

  def dashboard
  end

  def search
    @paginated_posts = Post.search(@search_form.q, current_lang).page(params[:p]).per(@settings.post.pagination.search)
  end

end
