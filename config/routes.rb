Rails.application.routes.draw do
#  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users,
             controllers: { omniauth_callbacks: 'sessions/omniauth_callbacks' }

  root to: 'home#index'

  namespace :cp do
    resource :dashboard, path: '', only: [:show]
    resources :meta_informations, only: [:index, :edit, :update, :destroy]
    resources :case_studies, path: 'case-studies'
    resources :posts, as: :blog_posts do
      member do
        get :publish
      end
    end
    resources :authors, as: :blog_authors
    resources :order_requests
    resources :hire_developers, path: 'hire-developers'
    resources :developments, path: 'developments'
    resources :feedbacks, path: 'feedbacks'
    resources :careers, path: 'careers'
  end

  namespace :careers do
    get 'new'
  end

  get 'services', to: 'services#index'
  get 'career', to: 'careers#index'
  get 'about-us', to: 'about_us#index'

  resources :case_studies, path: 'case-studies', only: [:index, :show]
  resources :hire_developers, path: 'hire-web-developers', only: [:index]
  resources :react_development, path: 'hire-react-developers', only: [:index]
  resources :php_development, path: 'hire-php-developers', only: [:index]
  resources :hire_team, path: 'hire-dedicated-team', only: [:index]
  resources :careers, path: 'careers', only: [:index]

namespace :services do
  get 'ruby-on-rails-development', to: 'ruby_on_rails#index'
  get 'node-js-development', to: 'nodejs#index'
  get 'react-js-development', to: 'reactjs#index'
  get 'fixed-price-cooperation-model', to: 'fixed_price#index'
  get 'time-and-material-cooperation-model', to: 'time_and_material#index'
  get 'dedicated-team-cooperation-model', to: 'dedicated_team#index'
end


  namespace :blog do
    resources :posts, only: [:index, :show], path: ''
  end
end

