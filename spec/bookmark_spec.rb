require 'bookmark.rb'

describe Bookmark do
  describe ".all" do
    it 'returns an array of bookmarks' do
      bookmark_array = [
        "http://www.makersacademy.com",
        "http://www.destroyallsoftware.com",
        "http://www.google.com"
      ]
      expect(described_class.all).to eq bookmark_array
    end
  end
end