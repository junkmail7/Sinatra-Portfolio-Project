require_relative 'config/environment'
class App < Sinatra::Base
    get '/' do
      "hello world"
    end
end