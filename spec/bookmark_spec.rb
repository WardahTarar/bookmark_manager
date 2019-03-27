require './lib/bookmark.rb'

describe Bookmark do

  subject(:list) {described_class.new}

  describe ".display_all" do
    it 'returns an array of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      expect(list.all).to include "http://www.makersacademy.com"
      expect(list.all).to include "http://www.destroyallsoftware.com"
      expect(list.all).to include "http://www.google.com"

    end
  end

  describe ".create" do
    it 'creates a new bookmark in bookmark database' do
      list.create(url: 'http://www.testbookmark.com')
      expect(list.all).to include 'http://www.testbookmark.com'
    end
  end
end