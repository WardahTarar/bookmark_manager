require 'sinatra/base'
require './lib/bookmark.rb'
require './spec/database_connection_setup'
require 'uri'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash 

  get "/" do
    erb :index
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/bookmarks' do
    flash[:notice] = "Invalid URL" unless Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :edit_bookmark
  end

  patch '/bookmarks/:id' do
    Bookmark.update(url: params[:url],title: params[:title],id: params[:id])
    redirect('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  run! if app_file == $0
end
