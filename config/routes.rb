RizzoExample::Application.routes.draw do


  # Styleguide
  root                              to: redirect('/app')
  get 'styleguide/',                to: redirect('/styleguide/block')

  get 'app'                 => 'application#show'
  get 'styleguide/*section' => 'styleguide#show'

end if defined?(RizzoExample::Application)
