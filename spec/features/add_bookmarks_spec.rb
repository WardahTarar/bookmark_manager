feature "Add bookmarks" do
  scenario "Adding bookmarks to the list" do
    visit('/')
    click_link("Add Bookmark")
    fill_in('bookmark', with: 'www.youtube.com')
    click_button("Submit")
    expect(page).to have_content("www.youtube.com")
  end
end