feature "Add bookmarks" do
  scenario "Adding bookmarks to the list" do
    visit('/add_bookmark')
    fill_in('url', with: 'http://www.testbookmark.com')
    fill_in('title', with: 'Test Bookmark')
    click_button("Submit")
    expect(page).to have_link('Test Bookmark', href: 'http://www.testbookmark.com')
  end

  scenario 'checks if the user entered a correct url' do
    visit('/add_bookmark')
    fill_in("url",with: "not a real bookmark")
    click_button('Submit')
    expect(page).to_not have_content "not a real bookmark"
    expect(page).to have_content "Invalid URL"
  end
end