require 'jekyll'
require 'sinatra'
require 'joke/helpers'

module Joke
  class App < Sinatra::Base

    helpers Joke::Helpers

    configure do
      set :port, 4000
    end

    set :public_folder, File.dirname(__FILE__) + '/public'

    before do
      options = {
        :url => "http://localhost:4000/preview",
        :baseurl => "/preview"
      }
      @site = Jekyll::Site.new(Jekyll.configuration(options))
      @rendered_site = @site.clone

      # Properly build one instance of the site
      @rendered_site.process

      # Leave one version of the site unprocessed
      @site.read
    end

    get '/' do
      erb :index
    end

    get '/pages' do
      @pages = @site.pages
      erb :pages
    end

    get '/pages/:name' do
      @page = find_page(@site, params[:name])
      erb :page
    end

    get '/posts' do
      @posts = @site.posts
      erb :posts
    end

    get '/config' do
      @config = @site.config
      erb :config
    end

    get "/preview/?*" do
      jekyll_preview(request.path) {404}
    end

  end
end
