require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(db_ame: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
    
    it 'checks that connection is persistent' do
      connection1 = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection1
    end 

  end
end
