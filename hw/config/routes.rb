Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/hw_page2'
  get 'welcome/hw_page3'
  root 'welcome#index'
  resources :articles do
    resources :comments
  end
  resources :welcome do 
    collection do
      get :hw_page2
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
