require 'database_connection'

class Accounts
    attr_accessor :id, :username, :email
end

class AccountsRepo

    def all
      results = DatabaseConnection.exec_params('SELECT * FROM accounts', [])

      accounts = []


      results.each do |record|
        account = Accounts.new
        account.id = record['id']
        account.username = record['username']
        account.email = record['email']
        
        accounts << account
      end
      return accounts
    end  



    


    def find(acc)
        results = DatabaseConnection.exec_params('SELECT * FROM accounts WHERE id = $1', [acc])

        accounts = []
        results.each do |record|
            account = Accounts.new
            account.id = record['id']
            account.username = record['username']
            account.email = record['email']
            
            accounts << account
          end
          return accounts
  
        #results.each do |record|
          
        #acc.id = record['id']
         # acc.username = record['username']
          #acc.email = record['email']
          
          #accounts << acc
        #end
        #return accounts
    end


    def create(acc)

    end


    def delete(acc)

    end


    def update(acc)

    end


end

