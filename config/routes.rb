Rails.application.routes.draw do
  resources :myposts do
    collection do
      post :confirm
    end
  end
end
