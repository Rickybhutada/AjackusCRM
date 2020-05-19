Rails.application.routes.draw do

  # Add default route with english I18n
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

  # Given support for I18n (English, Russian)
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'welcome#index'
  end

  # API End Point only for user create action, We can extend it
  namespace :api do
    namespace :v1 do
      resources :users,  :only=> :create
    end
  end

end
