ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/models/link'

class Manager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    Link.create(url:(params[:url]), title:(params[:title]))
    redirect '/links'
  end

  run! if app_file == $0
end
