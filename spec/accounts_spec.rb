require 'accounts'
require 'pg'

RSpec.describe AccountsRepo do

    def reset_socials
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'socials_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_socials
    end

    it "returns all of the items in the table" do
      repo = AccountsRepo.new

      

      accounts = repo.all

      expect(accounts[0].id).to eq '1'
      expect(accounts[0].username).to eq 'David'
      expect(accounts[0].email).to eq 'dave@gmail.com'
    end

    it 'finds a piece of data with the id as an arg' do
      repo = AccountsRepo.new

      account = Accounts.new

      result = repo.find('2')
      expect(result[0].id).to eq '2'
      expect(result[0].username).to eq 'Tim'
      expect(result[0].email).to eq 'timothy@yahoo.com'

    end  


    end