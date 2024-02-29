Rails.application.routes.draw do
  resources :definitions, path: 'def', as: 'def', only: %i[index show] do
    collection do
      get 'search'
    end
  end

  resources :analyses, path: 'summary', as:'summary', only: %i[index show]

  resources :dw_best_pratices, path: 'dwbp', only: %i[index show], as: 'opengov'

  resources :open_gov_principles, path: 'opengov', only: %i[index show], as: 'opengov'

  resources :pages, only: %i[index show] do
    collection do
      get 'search'
    end
  end

  resources :sites, only: %i[index show] do
    collection do
      get 'search'
    end
  end
  
  # Catch-all route
  root to: 'application#routing_forbidden', via: :all 
  match '*unmatched', to: 'application#routing_error', via: :all
end
