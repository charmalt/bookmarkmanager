require 'bookmark'

describe Bookmark do
  describe'.all' do
    it 'returns all bookmarks' do
      con = PG.connect(dbname: 'bookmark_manager_test')
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://makersacademy.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://google.com');")

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://google.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end
end
