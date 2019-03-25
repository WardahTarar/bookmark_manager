feature 'Viewing bookmars' do
  scenario 'visiting index page' do
    visit ('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'viewing bookmarks' do
    visit ('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end