class SessionsController < ApplicationController

  def new
    @sign_in_form = SignInForm.new(params[:sign_in_form])
  end

  def create
    @sign_in_form = SignInForm.new(params[:sign_in_form])
    if [@sign_in_form.username, @sign_in_form.password] == [@settings.admin.username, @settings.admin.password]
      session[:username] = @settings.admin.username
      redirect_to :dashboard, notice: I18n.t('flash.sessions.sign_in')
    else
      flash.now[:alert] = I18n.t('flash.sessions.invalid')
      render :new
    end
  end
   
  def destroy
    session[:username] = nil
    redirect_to :root, notice: I18n.t('flash.sessions.sign_out')
  end
   
 
end
