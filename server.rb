#!/usr/bin/env ruby

require "xmlrpc/server"

s = XMLRPC::Server.new(8080)

$tokens=Hash.new;

s.add_handler("sample.sumAndDifference") do |a,b|
  { "sum" => a + b, "difference" => a - b }
end

s.add_handler("sample.requestLogin") do |username|
    token=rand(36**9).to_s(36)
    $tokens[username]={:token => token, :time => Time.new}
    return {"token" => token}
    { "sum" => 2 }
end


s.add_handler("sample.requestLogin2") do |username|
    token=rand(36**9).to_s(36)
    $tokens[username]={:token => token, :time => Time.new}
    {"token" => token}
end

s.add_handler("sample.gettoken") do
  $tokens
end


s.add_handler("sample.zero") do
 asdfasfdasdf;
 (1/0).to_s;
end

s.add_handler("sample.zero2") do
 1/0
end

s.add_handler("sample.l") do |a,b|
  { "sum" => a + b, "difference" => a - b }
end


s.serve
