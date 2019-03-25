class Bookmark
  @bookmarks = [
    "http://www.makersacademy.com",
    "http://www.destroyallsoftware.com",
    "http://www.google.com"
  ]

  def self.all
    @bookmarks
  end
end