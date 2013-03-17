class CommentsController < ApplicationController

  before_action :set_post
  before_action :set_comment, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.lang = current_lang

    if @comment.save
      redirect_to @post, notice: I18n.t('flash.models.create', model: Comment.model_name.human) 
    else
      render 'posts/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: I18n.t('flash.models.destroy', model: Comment.model_name.human) 
  end

private
  def set_post
    @post = Post.find_by!(slug: params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find_by!(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:author, :body)
  end


end
