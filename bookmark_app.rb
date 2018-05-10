require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmark'
require_relative './lib/database'
require 'uri'

class BookmarkManager < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  get '/' do
    Bookmark.connect(Database)
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/add' do
    erb :add
  end

  post '/add' do
    flash[:error] = 'Invalid url' unless Bookmark.valid_url?(params[:url])
    Bookmark.add(params[:url], params[:title]) if Bookmark.valid_url?(params[:url])
    redirect '/add'
  end

  get '/delete' do
    @bookmarks = Bookmark.all
    erb :delete
  end

  post '/delete' do
    Bookmark.delete(params[:bookmark])
    redirect '/'
  end

  run! if app_file == $0
end
