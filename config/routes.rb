Rails.application.routes.draw do

  resources :questions
  resources :advertisement

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
