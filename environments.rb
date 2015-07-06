require 'yaml'

class Environments < Sinatra::Base
  configure :development do
    db = YAML.load_file('./config/database.yml')['development'].symbolize_keys!

    unless ActiveRecord::Base.connected?
      ActiveRecord::Base.establish_connection(
        adapter:   db[:adapter],
        host:      db[:host],
        username:  db[:username],
        password:  db[:password],
        database:  db[:database],
        encoding:  'utf8'
      )
      ActiveRecord::Base.logger = Logger.new(STDOUT)
    end

  end
end