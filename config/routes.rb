Rails.application.routes.draw do
  post '/object' => 'keys#check_body'
  get '/object/:data' => 'keys#get_value'
end