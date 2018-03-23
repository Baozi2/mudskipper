Rails.application.routes.draw do

  resources :users
  root 'plugins#index'
  resources :plugins do
    resources :plugin_instances do
      resources :plugin_upgrades, only: [:index]
    end
  end
  get 'chrome/order/updates.xml' => "plugins#update_xml"
  get 'chrome/crx' => "plugins#update_crx"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
