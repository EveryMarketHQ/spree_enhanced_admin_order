Spree::Core::Engine.add_routes do
  # Add your extension routes here
  Spree::Core::Engine.add_routes do
    namespace :admin, path: Spree.admin_path do
      resources :orders do
        member do
          post :resend_shipped
        end
      end
    end
  end
end
