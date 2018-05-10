require 'bookmark'

describe Bookmark do

  let(:url) { "http://airbnb.com" }
  let(:id) { 1 }

  describe '#initialize' do
    it 'sets id and url' do
      bookmark = Bookmark.new(id, url )
      expect(bookmark.id).to eq id
      expect(bookmark.url).to eq url
    end
  end

  describe '.add' do
    it 'add a bookmark to the list' do
      new_bookmark = 'http://asos.com'
      Bookmark.add('http://asos.com')
      expect(Bookmark.all).to include new_bookmark
    end
  end

  describe'.all' do
    it 'returns all bookmarks' do
      Bookmark.add('http://makersacademy.com')
      Bookmark.add('http://google.com')
      expect(Bookmark.all).to be_instance_of(Array)
    end
  end

end
