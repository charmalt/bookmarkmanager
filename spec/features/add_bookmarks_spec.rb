feature 'Add bookmarks' do
  scenario 'A user can add bookmarks' do
    #
    # con = PG.connect(dbname: 'bookmark_manager_test')
    # con.exec("INSERT INTO bookmarks VALUES(1, 'http://makersacademy.com');")
    # con.exec("INSERT INTO bookmarks VALUES(2, 'http://destroyallsoftware.com');")
    # con.exec("INSERT INTO bookmarks VALUES(3, 'http://google.com');")
    #
    visit '/bookmarks'
    fill_in 'bookmark', with: 'http://facebook.com'
    click_on 'submit'
    # visit '/bookmarks'
    expect(page).to have_content 'http://facebook.com'
  end
end
