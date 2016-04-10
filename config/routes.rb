Rails.application.routes.draw do
  devise_for :users
  get 'calendar/index'
  get 'calendar/events'
  get 'calendar/channels'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
