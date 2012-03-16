require 'sinatra'

filename = ENV['GCLOG'] || 'gitclycle_debug.log'

post '/log' do
  Thread.new do
    Logger.new(filename).debug "#{params[:transaction_id]}: #{params[:log]}"
  end
end
