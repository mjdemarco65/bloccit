Rails.application.routes.draw do

  resources :questions
  resources :advertisement
  resources :sponsoredposts
  resources :topics do
# #34
  resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'
  resources :sessions, only: [:new, :create, :destroy]



#  get 'posts/index'

#  get 'posts/show'

#  get 'posts/new'

#  get 'posts/edit'

  resources :posts

#  get 'welcome/index'

#  get 'welcome/about'
  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root 'welcome#index'
end
