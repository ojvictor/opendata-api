Rails.application.routes.draw do
  resources :analyses
  resources :dw_best_pratices
  resources :open_gov_principles
  resources :pages
  resources :sites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
