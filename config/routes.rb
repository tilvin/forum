Rails.application.routes.draw do

  root to: 'questions#index'
  resources :questions do

    resources :answers do
      resources :notes do
        put :agree, :disagree
      end
    end
  end

  devise_for :users
end
