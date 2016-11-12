require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry'

require_relative './classes/User.rb'

enable(:sessions)

# extra: que user sea un modelo en /classes folder
@@users = User_List.new
user = User.new('wolas','B5fkhjsd')
@@users.saveUser(user)

get '/' do
  erb(:index)
end

post "/log_in" do  
  user = User.new(params[:username],params[:password] )
  if ( @@users.contains_User?(user) )
    @message="Usuario Correcto.Bienvenido"
    session[:logged_in] = true
    session[:username] = user.username
    redirect("/profile")
  else
    @message="Usuario no Existente. Registrate"
    erb(:register)
  end
  #binding.pry
end

get '/register' do
  erb(:register)
end

post '/register' do
  # añadir un usuario
  user = params[:username]
  pass = params[:password] 
  label_page = :index
  if (user==nil||pass==nil||user==""||pass=="")
    @message="Usuario o password Incorrecto. Pruebe con otro"
    label_page = :register
  else
    newUser = User.new(user,pass)
    if (@@users.contains_User?(newUser))
      @message="Usuario YA Existente. Pruebe con otro"
      label_page = :register
    else
      @message = "Registro completado. Ahora haz el Login, venga!! "
      @@users.saveUser(newUser)
      label_page = :index
    end
  end
  erb(label_page)
end

get '/profile' do
  # solo puedes llegar si estas registrado
  if session[:logged_in]
    @username = session[:username]
    @message = session.to_s
    erb(:profile)
  else
    @message = "Eres un trampas"
    redirect('/')
  end
end