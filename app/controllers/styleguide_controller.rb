class StyleguideController < ActionController::Base

  def show
    render "/styleguide/styleguide", layout: 'layout'
  end

end
