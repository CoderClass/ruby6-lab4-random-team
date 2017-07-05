class HomeController < ApplicationController
  def index
  end

  def login
    session[:username] = params[:username]
    redirect_back fallback_location: root_path
  end

  def logout
    session[:username] = nil
    redirect_back fallback_location: root_path
  end
end
