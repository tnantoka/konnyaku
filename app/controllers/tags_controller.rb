class TagsController < ApplicationController

  def index
  end

  def show
    @paginated_posts = Post.tagged(params[:id], current_lang).page(params[:p]).per(@settings.view.pagination.search)
  end

end
