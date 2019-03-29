require 'pg'
require './lib/bookmark.rb'

def test_setup
  #p 'Setting up test database...'
  connection = PG.connect(dbname: 'bookmark_manager_test')
  
  connection.exec("DROP TABLE bookmarks;") #deletes before after every test

  connection.exec("CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));") #create new table before every test

end
