require 'jekyll'
require 'sinatra'

module Joke
  class App < Sinatra::Base

    configure do
      set :port, 4001
    end

    set :public_folder, File.dirname(__FILE__) + '/public'

    get '/' do
      options = Jekyll.configuration(Hash.new)
      @site = Jekyll::Site.new(options)
      @site.process
      erb :index
    end

  end
end
