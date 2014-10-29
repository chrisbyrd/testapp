require 'sinatra'
require 'json'
require 'net/http'


get '/test' do

  request = Net::HTTP::Get.new "http://bitstamp.net/api/transaction/"

  response = Net::HTTP.get_response("bitstamp.net","/api/transactions/")
  puts response.body





# Set the request URL
uri = URI.parse('http://bitstamp.net/api/transactions')
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)

# Set the request authentication headers
timestamp = Time.now.strftime('%Y%m%d %H:%M:%S')
                                
# Send the GET request
resp = http.request(request).body


puts resp

 
end



