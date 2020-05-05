Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :dishes
      resources :vendors
    end
  end

  root to: "home#index"

end
