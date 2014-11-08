class StyleguideController < ActionController::Base

  def show
    render "/styleguide/section", layout: 'layout'
  end

end
