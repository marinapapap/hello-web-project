require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do

    return 'hello'

  end

  get '/hello' do

    # name = params[:name]

    # return "Hello #{name}"

    erb(:index)
  end

  post '/submit' do

    name = params[:name]
    message = params[:message]

    return "Hello #{name}, you just sent this message: '#{message}'"
  end

  get '/names' do

    return "Julia, Mary, Karim"

  end
end
