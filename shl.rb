require 'open-uri'
require 'json'
require 'openssl'

print "What is the permit ID for the car?"
permit_id = gets.chomp
puts "*"*40

result_permit = open("https://data.cityofnewyork.us/resource/yhuu-4pt3.json?license_number=#{permit_id}", {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read

data = JSON.parse(result_permit)

data[0].each do |key, value|
  puts "#{key.ljust(30,".")}#{value.rjust(30,".")}"
end
