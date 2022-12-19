Rails.application.routes.draw do
  root 'bookmarks#index'
  post 'add_bookmark/:id' => 'bookmarks#add_bookmark', as: 'add_bookmark'
  delete 'delete_bookmark/:id' => 'bookmarks#delete_bookmark', as: 'del_bookmark'
  get 'users/new' => 'users#new', as: 'new_user'
  post 'users' => 'users#create', as: 'users'
  delete 'logout' => 'sessions#logout', as: 'logout'
  get 'mypage' => 'users#show', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
