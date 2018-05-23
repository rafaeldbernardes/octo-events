# == Route Map
#
#       Prefix Verb URI Pattern                        Controller#Action
# issue_events GET  /issues/:issue_id/events(.:format) events#index {:formats=>:json}
#       events POST /events(.:format)                  events#create {:formats=>:json}

Rails.application.routes.draw do
  resources :issues, only: [] do
    resources :events, only: [:index], defaults: { formats: :json }
  end

  resource :events, only: :create, defaults: { formats: :json }
end
