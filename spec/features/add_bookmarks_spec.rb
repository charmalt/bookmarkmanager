feature 'Add bookmarks' do
  scenario 'A user can add bookmarks' do
    visit '/bookmarks'
    fill_in 'bookmark', with: 'http://facebook.com'
    click_on 'submit'
    expect(page).to have_content 'http://facebook.com'
  end
end
