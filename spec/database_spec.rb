require 'database'

describe Database do

  let(:database) { Database.new }

  describe '#self.connect' do

    it 'returns a connection' do
      expect(Database.connect).to be_instance_of(PG::Connection)
    end

  end



end
