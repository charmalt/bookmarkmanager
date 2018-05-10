feature 'Delete bookmarks' do
  scenario 'can select which bookmark to delete' do
    visit '/'
    click_on 'Delete'
    expect(page).to have_content "Please select the bookmark you want to delete."
  end

  scenario 'can delete a bookmark from database' do
    visit '/bookmarks'
    expect(page).to have_content "http://makersacademy.com"
    visit '/'
    click_on 'Delete'
    check("0")
    click_on 'Delete'
    visit '/bookmarks'
    expect(page).not_to have_content "http://makersacademy.com"
  end
end
