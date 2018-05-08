require 'sinatra/base'

class Bookmark < Sinatra::Base

  get '/' do
    erb(:index)
  end

end
