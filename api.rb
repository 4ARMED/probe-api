require 'sinatra'
require 'json'

before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*', 
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET'] 
end

get '/probes' do
  ssids = File.readlines('/tmp/probes.txt').uniq.collect {|ssid| ssid.chomp}

  clean_ssids = ssids - [""]
	clean_ssids.reverse.to_json
end


