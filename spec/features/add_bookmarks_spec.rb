feature "Add bookmarks" do
  scenario "Adding bookmarks to the list" do
    visit('/add_bookmark')
    fill_in('url', with: 'www.youtube.com')
    click_button("Submit")
    expect(page).to have_content("www.youtube.com")
  end
end