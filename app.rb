require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
        @user_name = params[:user_name] 
	@phone = params[:phone]
	@date_time = params[:date_time]

input = File.open("./public/users.txt", 'a')
input.write "User_name: #{@user_name}, Phone: #{@phone}, Date & time: #{@date_time}\n"
input.close

	@title = 'Thank you!'
	@message = "Dear #{@user_name}, we'll be waiting for you at #{@date_time}"

	erb :message
end