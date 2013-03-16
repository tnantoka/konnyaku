class WelcomeController < ApplicationController

  before_action :sign_in_required, only: [:dashboard]

  def index
    @paginated_posts = @posts.page(params[:p]).per(@settings.post.pagination.recent)
  end

  def dashboard
  end

end
