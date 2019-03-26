require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get "/" do
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/add_bookmark' do
    @new_bookmark = params[:bookmark]
    redirect "/bookmarks"
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.new.display_all
    erb :bookmarks
  end

  run! if app_file == $0
end
