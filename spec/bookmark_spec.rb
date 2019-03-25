require 'bookmark.rb'

describe Bookmark do
  describe ".all" do
    it 'returns an array of bookmarks' do
      bookmarks = described_class.all

      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"

    end
  end
end