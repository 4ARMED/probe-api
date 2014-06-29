require 'sinatra'
require 'mysql2'
require 'json'

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*', 
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET'] 

end

# Use environment variable or default to /opt/snoopy-ng
ENV['snoopy_db_file'] ||= '/opt/snoopy-ng/snoopy.db'
ENV['snoopy_db_host'] ||= 'localhost'
ENV['snoopy_db_user'] ||= 'root'
ENV['snoopy_db_name'] ||= 'snoopy'

get '/probes' do

	# retrieve latest ssids from snoopy
	begin
		db = Mysql2::Client.new(:host => ENV['snoopy_db_host'], :username => ENV['snoopy_db_user'], :database => ENV['snoopy_db_name'])
		ssids = []

		rows = db.query "SELECT * FROM wifi_client_ssids"
		rows.each do |row|
			ssids << row['ssid']
		end	

		ssids.uniq.reverse.to_json
	end
end


