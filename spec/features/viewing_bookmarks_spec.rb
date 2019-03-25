feature 'Viewing bookmars' do
  scenario 'visiting index page' do
    visit ('/')
    expect(page).to have_content "Bookmark Manager"
  end
end