class VersionsController < ApplicationController

  before_action :set_post

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
