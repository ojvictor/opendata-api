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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
