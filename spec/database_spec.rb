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

  context 'given one item added to the database' do
    describe '#self.all' do

      it 'return all items in the database' do
        Database.add(url, title)
        expect(Database.all.last[1]).to eq url
        expect(Database.all.last[2]).to eq title
      end

    end

    describe '#self.delete' do

      it 'delete the item in the database' do
        expect(Database.all).not_to be_nil
        expect(Database.delete(title)).to be_instance_of(PG::Result)
        expect(Database.all).to eq []
      end

    end

    describe '#self.truncate' do

      it 'delete all items from table' do
        2.times { Database.add(url, title) }
        Database.truncate
        expect(Database.all).to eq []
      end

    end
  end

end
