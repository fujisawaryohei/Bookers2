Rails.application.routes.draw do
  # 静的ページ ルーティング
  root 'homes#index'
  get '/home/about', to: "homes#about"

  # 認証 ルーティング
  devise_for :users, controllers: {
    'registrations': 'registrations',
    'sessions': 'sessions',
    'passwords': 'passwords'
  }

  # Userリソース ルーティング
  resources :users, except: [:new, :create]

  # Bookリソース ルーティング
  resources :books, except: [:new]

  # Letter_opener_web
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
