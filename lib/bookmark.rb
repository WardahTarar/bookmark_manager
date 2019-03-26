require 'pg'

class Bookmark
  def initialize
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
      else
      @connection = PG.connect(dbname: 'bookmark_manager')
      end
    end
  def display_all
    result = @connection.exec("SELECT * FROM bookmarks ORDER BY id;")
    result.map { |bookmark| bookmark['url'] }
  end 

  def add_bookmark
  end
end