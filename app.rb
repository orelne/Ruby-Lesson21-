require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :index			
end

get '/about' do
	@error = 'something wrong!!!'
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
		@barber = params[:barber]
		@color = params[:color]

		hh = { :user_name => 'Введите имя',
				 :phone => 'Введите номер телефона',
				 :date_time => 'Введите дату и время' }

@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

if @error != ''
	return erb :visit
end

	#	hh.each do |key, value|
	#		if params[key] == ''
	#			@error = hh[key]
	#			return erb :visit
					 	
	#		 end
	#	end		 

			
input = File.open("./public/users.txt", 'a')
input.write "User_name: #{@user_name}, Phone: #{@phone}, Date & time: #{@date_time}, Barber: #{@barber}, Color: #{@color}\n"
input.close

input = File.open("./public/contacts.txt", 'a')
input.write "User_name: #{@user_name}, Phone: #{@phone}\n"
input.close

	@title = 'Thank you!'
	@message = "Dear #{@user_name}, we'll be waiting for you at #{@date_time}"

	erb :message
end