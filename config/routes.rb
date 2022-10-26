# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :expenses
  resources :shared_lists, only: %i[index new create]
  root 'expenses#index'
end
