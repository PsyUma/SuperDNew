Rails.application.routes.draw do
  get 'board/index'

  get 'board/filter'

  get 'board/sendmail'

  get 'board/edit'

  devise_for :users
  root "super_d_uploads#index"
  resources :super_d_uploads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
