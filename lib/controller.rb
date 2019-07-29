require 'gossip'

class ApplicationController < Sinatra::Base
  
  get '/' do # Page d'acceuil
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do # Enregistre un nouveau gossip dans le CSV
  	Gossip.new(params["gossip_author"], params["gossip_content"]).save
  	redirect '/'
  end

  #get '/gossips/:id/' do
  #	"Voici le numéro du potin que tu veux : #{params["id"]}"
  #end

  get '/gossips/show/:id' do # Page d'affichage d'un gossip en fonction de son id
    gossip_id = params["id"]
    gossip = Gossip.find(params["id"])
    erb :show, locals: {gossip_id: gossip_id, gossip: gossip}
  end

end