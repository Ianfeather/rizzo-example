class ApplicationController < ActionController::Base

  def show
    render "/index", layout: 'layout'
  end


end
