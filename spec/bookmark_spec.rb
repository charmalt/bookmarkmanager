require 'bookmark'

describe Bookmark do

  let(:url) { "http://airbnb.com" }
  let(:id) { 1 }
  let(:title) {"Airbnb"}

  let(:database) { double :database }
  subject(:bookmark) { Bookmark.new(id, url, title) }

  before do
    expect(database).to receive(:connect)
    Bookmark.connect(database)
  end

  describe '#initialize' do
    it 'has attribute id' do
      expect(bookmark.id).to eq id
    end

    it 'has attribute url' do
      expect(bookmark.url).to eq url
    end

    it 'has attribute title' do
      expect(bookmark.title).to eq title
    end
  end

  describe '.add' do
    it 'add a bookmark to the list' do
      expect(database).to receive(:add).with(url,title)
      Bookmark.add(url,title)
    end
  end

  describe '.all' do
    it 'should return an array' do
      expect(database).to receive(:all).and_return [[id, url, title]]
      expect(Bookmark.all.last).to be_instance_of(Bookmark)
    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the list' do
      expect(database).to receive(:delete)
      Bookmark.delete(title)
    end
  end

end
