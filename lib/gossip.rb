require 'csv'

class Gossip

	attr_reader :content, :author

	def initialize(author, content)
		@content = content
  		@author = author
	end

	def save
    	CSV.open("db/gossip.csv", "ab") do |csv|
    		csv << [@author, @content]
    	end
  	end

  	def self.all # Affiche tout les gossips
  		all_gossips = []
  		CSV.read("./db/gossip.csv").each do |csv_line|
    		all_gossips << Gossip.new(csv_line[0], csv_line[1])
  		end
  	return all_gossips
	end

	def self.find(id) # Permet de chercher un gossip en fonction de son id
		gossip_array = Gossip.all
        return gossip_array[id.to_i]
	end

end