require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'
require 'uri'

class BookmarkManager < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/bookmarks' do
    p @bookmarks = Bookmark.all.join("<br>")
    erb :bookmarks
  end

  post '/bookmarks' do
    if params[:bookmark] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.add(params[:bookmark])
    else
      flash[:error] = 'please enter a valid url'
    end
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
