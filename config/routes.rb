Rails.application.routes.draw do
  # トップページ
  root 'homes#index'

  # 静的ページ ルーティング
  HomesController.action_methods.each do |action|
    get "homes/#{action}" unless action == 'index'
  end

  # 認証 ルーティング
  devise_for :users, controlers: {
    'registrations': 'registrations',
    'sessions': 'sessions',
    'passwords': 'passwords'
  }

  # Userリソース ルーティング
  resources :users, exept: [:new, :create]

  # Postリソース ルーティング
  resources :books
end
