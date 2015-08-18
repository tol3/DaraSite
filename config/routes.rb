Rails.application.routes.draw do

  get 'sessions/create'

  get 'travel' => 'travel_by_sense#index'
  get 'travel/:id' => 'travel_by_sense#show'

  get 'gossip' => 'gossip#index'
  get 'gossip/:id' => 'gossip#show'

  get 'lifestyle' => 'life_style#index'
  get 'lifestyle/:id' => 'life_style#show'

  get 'beauty' => 'beauty_by_stunning#index'
  get 'beauty/:id' => 'beauty_by_stunning#show'

  get 'myidol' => 'my_idol#index'
  get 'myidol/:id' => 'my_idol#show'

  get 'society' => 'society#index'
  get 'society/:id' => 'society#show'

  get 'music' => 'music#index'
  get 'music/:id' => 'music#show'

  get 'lakorn' => 'lakorn#index'
  get 'lakorn/:id' => 'lakorn#show'

  get 'movie' => 'movie#index'
  get 'movie/:id' => 'movie#show'

  get 'hotclip' => 'hot_clip#index'
  get 'hotclip/:id' => 'hot_clip#show'

  get 'event' => 'event#index'
  get 'event/:id' => 'event#show'

  scope '/party' do
    get 'calendar' => 'party#index'
    get 'chill' => 'party#chill_2_night'
    get 'after_party' => 'party#after_party'
    get '/:id' => 'party#show'
  end

  get 'news' => 'news#index'
  get 'news/:id' => 'news#show'

  post '/tinymce_assets' => 'tinymce_assets#create'

  get 'tinymce_assets/create'

  get 'home' => 'dara#index'
  get 'contact' => 'dara#contact'
  get 'about' => 'dara#about'
  post 'search' => 'dara#search'

  get '/auth/:provider/callback' => 'sessions#create'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # get '/admin/news/:id/put_wall' => 'admin#news#put_wall'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dara#index'
  #
  # match "home" => "dara#index"
  # match "contact" => "dara#contact"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
