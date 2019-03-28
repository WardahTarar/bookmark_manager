require 'pg'

def test_setup
  p 'Setting up test database...'
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks;")
end

# def persisted_data(id:)
#   connection = PG.connect(dbname: 'bookmark_manager_test')
#   result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
#   result.first
# end