feature 'Add bookmarks' do
  xscenario 'A user can add bookmarks' do
    visit '/bookmarks'
    fill_in 'bookmark', with: 'http://facebook.com'
    click_on 'submit'
    expect(page).to have_content 'http://facebook.com'
  end

  xscenario 'displays error if invalid url is submitted' do
    visit '/bookmarks'
    fill_in 'bookmark', with: 'ddddd'
    click_on 'submit'
    expect(page).not_to have_content 'ddddd'
    expect(page).to have_content 'please enter a valid url'
  end
end
