Rails.application.routes.draw do

  root to: "heroes#index"

  get "heroes/all" => "heroes#all"

end
