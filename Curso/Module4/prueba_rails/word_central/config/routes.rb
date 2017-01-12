Rails.application.routes.draw do

  root "site#home"

  get "/text_inspections/new", to: "text_inspections#new"

  # ***** New *****
  post "/text_inspections", to: "text_inspections#create"

end
