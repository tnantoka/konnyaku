class WelcomeController < ApplicationController

  before_action :sign_in_required, only: [:dashboard]

  def index
  end

  def dashboard
  end

end
