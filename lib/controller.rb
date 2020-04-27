
require 'gossip'

class ApplicationController < Sinatra::Base
  
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  # Opens the new gossip page
  get '/gossips/new/' do
    erb :new_gossip
  end

  # Passes the values from new gossip
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end


    # Dynamic url for individual gossips
    get '/gossips/:id' do
      erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
    end
  
    # Opens the edit page based on individual gossip
    get '/gossips/:id/edit' do
      erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
    end
  
    # Gets the edits & updates them in csv
    post '/gossips/edit/' do
      Gossip.update(params['id'].to_i,params["gossip_author"], params["gossip_content"])
      redirect '/'
    end

end
