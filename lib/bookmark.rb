require 'pg'

class Bookmark

  attr_reader :connection

  def initialize
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def all
    result = @connection.exec("SELECT * FROM bookmarks ORDER BY id;")
    result.map { |bookmark| bookmark['url'] }
  end 
  
  def create(url:)
    @connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

end