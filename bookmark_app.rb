require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'
require 'uri'

class BookmarkManager < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    if params[:bookmark] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.add(params[:bookmark], params[:title])
    else
      flash[:error] = 'please enter a valid url'
    end
    redirect '/bookmarks'
  end

  get '/delete' do
    @bookmarks = Bookmark.all
    erb :delete
  end

  post '/delete' do
    Bookmark.delete(params[:bookmark])
  end

  run! if app_file == $0
end
