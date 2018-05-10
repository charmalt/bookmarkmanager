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

  describe'.all' do
    it 'returns an instance of Bookmark' do
      Bookmark.add('http://makersacademy.com')
      expect(Bookmark.all.first).to be_instance_of(Bookmark)
    end

    it 'should return an array' do
      Bookmark.add('http://google.com')
      expect(Bookmark.all).to be_instance_of(Array)
    end
  end

  describe '.add' do
    it 'add a bookmark to the list' do
      new_bookmark = 'http://asos.com'
      Bookmark.add('http://asos.com')
      expect(Bookmark.all.last.url).to eq new_bookmark
    end
  end

end
