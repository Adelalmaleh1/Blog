Rails.application.routes.draw do
  resources :posts do
  	delete 'soft_delete' => 'posts#soft_delete'
    resources :comments
  end

  root 'posts#index'

  
end
