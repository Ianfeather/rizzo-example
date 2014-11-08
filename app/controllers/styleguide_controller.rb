class StyleguideController < ActionController::Base

  def show
    render "/styleguide/#{params[:section]}"
  end

end
