require 'sinatra/base'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  get "/" do
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    # Bookmark.create(url: params[:url])
    url = params[:url]
    connection = Bookmark.new.connection
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.new.display_all
    erb :bookmarks
  end

  run! if app_file == $0
end
