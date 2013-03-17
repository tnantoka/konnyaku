class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_required, except: [:index, :show]
  before_action :redirect_to_primary, only: [:show, :edit]
  skip_before_action :enable_sidebar, only: [:new, :create, :edit, :update]

  def index
    @paginated_posts = Post.index(current_lang).page(params[:p]).per(@settings.post.pagination.admin)
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
    Lang.all.each do |lang|
      content =  @post.contents.build
      content.lang = lang 
      content.tags = {}
    end
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: I18n.t('flash.models.create', model: Post.model_name.human) 
    else
      render action: 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: I18n.t('flash.models.update', model: Post.model_name.human) 
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to :posts, notice: I18n.t('flash.models.destroy', model: Post.model_name.human) 
  end

  def markdown
    content = Content.new(body: params[:body])
    render text: content.render.to_s, content_type: 'text/html'
  end

private
  def set_post
    @post = Post.find_by!(slug: params[:id])
  end

  def post_params
    params.require(:post).permit(:category_id, :slug, contents_attributes: [:lang_id, :title, :body, :tags, :id])
  end

  def redirect_to_primary
    unless @post.langs.include?(current_lang)
      if params[:action] != 'edit'
        redirect_to post_url(@post, l: Lang.primary.code)
      else
        redirect_to edit_post_url(@post, l: Lang.primary.code)
      end
    end
  end

end
