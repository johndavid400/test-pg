Rails.application.routes.draw do
  resources :books
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'api/success'       => 'api#success'
  post 'api/timestamp'     => 'api#timestamp'
  post 'api/seconds'       => 'api#seconds'
  post 'api/no_retry'      => 'api#no_retry'
  post 'api/error'         => 'api#error'

  get 'foo' => 'books#foo'
end
