Rails.application.routes.draw do
  resources :advertisements
  resources :posts
#  get 'posts/index'

#  get 'posts/show'

#  get 'posts/new'

#  get 'posts/edit'



#  get 'welcome/index'

#  get 'welcome/about'
  get 'about' => 'welcome#about'

  get 'welcome/contact'

  get 'welcome/faq'

  root 'welcome#index'
end
