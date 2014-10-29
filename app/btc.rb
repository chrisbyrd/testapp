require 'json'
require 'net/https'
require 'pp'
#require 'sinatra'

 
def fetch(uri)
  uri = URI.parse(uri)
  http = Net::HTTP.new(uri.host, uri.port)
 
  if uri.scheme == 'https'
    http.use_ssl = true
    # Should set certificate and change to VERIFY_PEER
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end
 
  request = Net::HTTP::Get.new(uri.request_uri)
 
  # Send the GET request
  resp = http.request(request)
 
  @out = "HTTP/#{resp.http_version} #{resp.code} #{resp.message}\n"
  resp.each_header do |header, value|
    @out += header.capitalize.gsub(/\-([a-z])/) { |m| "-#{m[1].chr.upcase}" }
    @out += ": #{value}\n"
  end
 
  @out += "\n#{resp.body}"
 
  json = JSON.load(resp.body)
end
 
json = fetch('https://www.bitstamp.net/api/transactions/')
 
puts @out
pp json


#get '/test' do
#  content_type :txt
#  fetch('https://www.bitstamp.net/api/transactions/')
#  @out
#end
