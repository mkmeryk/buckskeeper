Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  get('/flh',{to:'flh#index'})
  resources :users
  resource :sessions, only: [:new, :destroy, :create]

  namespace :flh do
    namespace :resources do
      resources :posts, controller: 'flh_resources_post' do
        resources :likes, shallow: true, only: [:create, :destroy], controller: 'flh_resources_likes'
        get :liked, on: :collection
      end
    end
    namespace :society do
      resources :questions, controller: 'flh_society_questions' do
        resources :answers, only:[:create, :destroy], controller: 'flh_society_answers'
        resources :likes, shallow: true, only: [:create, :destroy], controller: 'flh_society_likes'
        get :liked, on: :collection
      end
    end
    resources :modules, controller: 'flh_modules'
    resources :events, controller: 'fel_events'
     
  end
  
  namespace :personal do
    resources :income, controller: 'personal_incomes'
    resources :expenses, controller: 'personal_expenses'
    resources :savings, controller: 'personal_savings'
  end

  namespace :business do
    resources :income, controller: 'business_incomes'
    resources :expenses, controller: 'business_expenses'
    resources :savings, controller: 'business_savings'
  end
 


 


end
