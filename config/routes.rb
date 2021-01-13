
Rails.application.routes.draw do
  get 'example_1', to: 'application#example_1'
  get 'example_2', to: 'application#example_2'
  get 'example_3', to: 'application#example_3'
  post 'example_3', to: 'application#example_3_create'
end
