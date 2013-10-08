require 'jekyll'
require 'sinatra'

module Joke
  class App < Sinatra::Base

    configure do
      set :port, 4001
    end

    set :public_folder, File.dirname(__FILE__) + '/public'

    before do
      options = Jekyll.configuration(Hash.new)
      @site = Jekyll::Site.new(options)
      @site.process
    end

    get '/' do
      erb :index
    end

    get '/pages' do
      @pages = @site.pages
      erb :pages
    end

    get '/posts' do
      @posts = @site.posts
      erb :posts
    end

    get '/config' do
      @config = @site.config
      erb :config
    end

  end
end
