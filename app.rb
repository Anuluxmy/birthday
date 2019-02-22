require 'sinatra/base'

class Birthday < Sinatra::Base
get '/' do
  erb :index
end

post '/display' do
  @name = params[:name]
  @day = params[:day]
  @month = params[:month]
  @birthday = Date.new(2019,@month.to_i,@day.to_i)
  erb :display
end

run! if app_file == $0
end
