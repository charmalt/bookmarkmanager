feature 'Add bookmarks' do
  scenario 'A user can add bookmarks by providing a url and title' do
    visit '/bookmarks'
    fill_in 'bookmark', with: 'http://facebook.com'
    fill_in 'title', with: 'Facebook'
    click_on 'submit'
    expect(page).to have_content 'http://facebook.com'
    expect(page).to have_content 'Facebook'
  end

  scenario 'displays error if invalid url is submitted' do
    visit '/bookmarks'
    fill_in 'bookmark', with: 'ddddd'
    click_on 'submit'
    expect(page).not_to have_content 'ddddd'
    expect(page).to have_content 'please enter a valid url'
  end
end
