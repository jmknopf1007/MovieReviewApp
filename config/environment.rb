require 'bundler'
require 'io/console' 
Bundler.require

require_all 'lib'


ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3', 
    database: 'db/movies2.db'   
    )

ActiveRecord::Base.logger = nil
