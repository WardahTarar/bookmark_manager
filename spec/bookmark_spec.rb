require './lib/bookmark.rb'

describe Bookmark do

  subject(:subject) {described_class.new}
  describe ".display_all" do
    it 'returns an array of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      subject = described_class.new.display_all

      expect(subject).to include "http://www.makersacademy.com"
      expect(subject).to include "http://www.destroyallsoftware.com"
      expect(subject).to include "http://www.google.com"

    end
  end

end