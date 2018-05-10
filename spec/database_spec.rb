require 'database'

describe Database do

  let(:database) { Database.new }
  let(:url) { 'http://makersacademy.com' }
  let(:title) { 'Makers' }

  describe '#self.connect' do

    it 'returns a connection' do
      expect(Database.connect).to be_instance_of(PG::Connection)
    end

  end

  describe '#self.add' do

    it 'adds item to the database' do
      expect(Database.add(url, title)).to be_instance_of(PG::Result)
    end

  end

  describe '#self.all' do

    it 'return all item to the database' do
      expect(Database.all.last[1]).to eq url
      expect(Database.all.last[2]).to eq title
    end

  end
end
