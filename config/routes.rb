Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'deposit_payments#euro'
  resources :deposit_payments do
    collection do
      get :euro
      get :usd
    end
  end
end
