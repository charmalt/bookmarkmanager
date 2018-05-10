require './spec/features/web_helper'

feature 'Add' do

  scenario 'Add bookmark by providing a url and title' do
    add_url
    click_on 'Submit'
  end

  scenario 'Display error if invalid url' do
    add_invalid_url
    expect(page).to have_content 'Invalid url'
    view_bookmarks
    expect(page).not_to have_content 'ddddd'
  end

end

feature 'View' do

  scenario 'User can see bookmarks' do
    add_url
    view_bookmarks
    expect(page).to have_content 'Facebook : http://facebook.com'
  end

end

feature 'Delete' do

  scenario 'Select bookmark to delete' do
    view_delete
    expect(page).to have_content "Please select the bookmark you want to delete."
  end

  scenario 'delete selected bookmark from database' do
    add_url
    view_delete
    select_and_delete
    view_bookmarks
    expect(page).not_to have_content 'Facebook : http://facebook.com'
  end

end
