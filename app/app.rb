ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require_relative 'models/link'
require_relative 'models/tag'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.all(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
  	redirect '/links'
  end

    # start the server if ruby file executed directly
  run! if app_file == $0
end
