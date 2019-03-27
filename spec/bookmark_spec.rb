require './lib/bookmark.rb'

describe Bookmark do

  describe ".all" do
    it 'returns an array of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.first['id']
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      # expect(list.all).to include "http://www.makersacademy.com"
      # expect(list.all).to include "http://www.destroyallsoftware.com"
      # expect(list.all).to include "http://www.google.com"

    end
  end

  describe ".create" do
    it 'creates a new bookmark in bookmark database' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark').first

      expect(bookmark['url']).to eq 'http://www.testbookmark.com'
      expect(bookmark['title']).to eq 'Test Bookmark'
      # expect(list.all).to include 'http://www.testbookmark.com'
    end
  end
end