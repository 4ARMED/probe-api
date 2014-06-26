require 'sinatra'
require 'sqlite3'
require 'json'

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*', 
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET'] 

end

# Use environment variable or default to /opt/snoopy-ng
ENV['snoopy_db_file'] ||= '/opt/snoopy-ng/snoopy.db'

get '/probes' do

	# retrieve latest ssids from snoopy
	begin
		db = SQLite3::Database.open ENV['snoopy_db_file'], { :busy_timeout => 1000 }
		ssids = []

		rows = db.execute "SELECT ssid FROM wifi_client_ssids"
		rows.each do |row|
			ssids << row.first
		end	

		ssids.uniq.reverse.to_json

	rescue SQLite3::Exception => e
		puts "Exception occurred"
		puts e

	ensure
		db.close if db
	end
end


