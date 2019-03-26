require 'pg'

def test_setup
  p 'Setting up test database...'

  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks;")
end