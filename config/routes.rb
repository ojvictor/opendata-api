Rails.application.routes.draw do
  resources :definitions, only: %i[index show]

  resources :analyses, only: %i[index show]

  resources :dw_best_pratices, only: %i[index show]

  resources :open_gov_principles, only: %i[index show]

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
