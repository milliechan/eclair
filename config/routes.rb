Rails.application.routes.draw do
  resources :users do
    resources :medications
  end

  

  root 'welcome#index'
end
