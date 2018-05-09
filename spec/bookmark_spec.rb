require 'bookmark'

describe Bookmark do
  describe'.all' do
    it 'returns all bookmarks' do
      Bookmark.add('http://makersacademy.com')
      Bookmark.add('http://google.com')

      expected_bookmarks = [
        'http://makersacademy.com',
        'http://google.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end
end
