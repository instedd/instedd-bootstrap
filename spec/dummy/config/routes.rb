Rails.application.routes.draw do

  mount InsteddBootstrap::Engine => "/instedd-bootstrap"

  get "home/index" => "home#index"

  root to: 'home#index'

end
