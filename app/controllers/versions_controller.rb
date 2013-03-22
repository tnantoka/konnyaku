class VersionsController < ApplicationController

  before_action :set_post
  skip_before_action :enable_sidebar, only: [:show]

  def index
    @versions = @post.versions(current_lang)
  end

  def show
    @version = Version.find(params[:id])
  end

private
  def set_post
    @post = Post.find_by!(slug: params[:post_id])
  end

end
