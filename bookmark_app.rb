require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.all.join("<br>")
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.add(params[:bookmark])
    redirect '/bookmarks'
    # erb :bookmarks
  end

  run! if app_file == $0
end
