require 'sinatra/base'

class Battle < Sinatra::Base

  enable :sessions

  # client makes get request to the server
  # and the form is rendered
  get '/' do
    erb :index
  end

  # once the form is rendered the user fills it in.
  # the user then submist the form - this makes a POST
  # request to the server.
  #
  # The form data is available in the params hash.
  # This is then stored in the session (sessions
  # are an in memory data store that allows information
  # to be used between requests).
  #
  # The POST response sends a redirect (Header 'Location: redirect/path')
  # The browser reads the Location header and sends a GET request to the
  # specified path.
  post '/names' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/play'
  end

  # this is the path of the redirect.
  # The Names entered in the form and stored in the session hash
  # are reaccessed and stored in instance variables.
  #
  # These variables are then available in the play view (play.erb)
  #
  # play.erb is rendered on the browser with the correct data.
  get '/play' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :play
  end

  get '/attack' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    erb :attack
  end



  run! if app_file == $0
end
