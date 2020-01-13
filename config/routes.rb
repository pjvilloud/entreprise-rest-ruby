Rails.application.routes.draw do
  resources :employes do
    collection do
      get 'count'
    end
  end
end