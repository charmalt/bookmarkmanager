feature 'View bookmarks' do
  scenario 'A user can see bookmarks' do
    con = PG.connect(dbname: 'bookmark_manager_test')
    con.exec("INSERT INTO bookmarks VALUES(1, 'http://makersacademy.com');")
    con.exec("INSERT INTO bookmarks VALUES(2, 'http://destroyallsoftware.com');")
    con.exec("INSERT INTO bookmarks VALUES(3, 'http://google.com');")

    visit '/bookmarks'

    expect(page).to have_content 'http://makersacademy.com'
    expect(page).to have_content 'http://destroyallsoftware.com'
    expect(page).to have_content 'http://google.com'
  end
end
