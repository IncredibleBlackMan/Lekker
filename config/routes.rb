Rails.application.routes.draw do
  resource :signup, only: %i[create]
  resources :authentications, only: %i[create]
  resources :status_managements, only: %i[index]
  resources :users, only: %i[index] do
    member do
      put :archive
      put :unarchive
    end
  end
end
