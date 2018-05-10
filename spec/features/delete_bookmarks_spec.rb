feature 'Delete bookmarks' do
  scenario 'A user can delete bookmarks' do
    visit '/'
    click_on 'Delete'
    expect(page).to have_content "Please select the bookmark you want to delete."
  end
end
