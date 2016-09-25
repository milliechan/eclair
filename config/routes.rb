Rails.application.routes.draw do
  resources :users do
    resources :medications
  	get 'donut', to: 'users#donut'
  end

  root 'welcome#index'
end
