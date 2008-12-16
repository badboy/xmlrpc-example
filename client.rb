#!/usr/bin/env ruby

require "xmlrpc/client"

$client = XMLRPC::Client.new( "localhost", "/", 8080)

def callxml(met, *args)
  begin
    puts "#{met}(#{args.join(', ')})"
    p $client.call(met, *args)
  rescue Exception => boom
    puts " !!! exception caught: #{boom}"
    puts "  "+boom.message
  end
  puts
end

callxml "sample.sumAndDifference", 3,5
callxml "sample.requestLogin", 'test'
callxml "sample.requestLogin", 42
callxml "sample.requestLogin2", 'test'
callxml "sample.requestLogin2", 42
callxml "sample.gettoken"
callxml "sample.zero"
callxml "sample.zero2"
callxml "sample.l", 7,8
