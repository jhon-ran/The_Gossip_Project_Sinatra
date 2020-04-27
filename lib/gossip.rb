
require 'csv'
require 'pry'

class Gossip
  attr_accessor :author, :content, :all_gossips

  def initialize(author, content)
      @author = author
      @content = content
  end

  # Saves into the csv doc
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  # Returns an array with all the gossips
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  # Allows finding a gossip 
  def self.find(id)
    gossips = []
    CSV.read("./db/gossip.csv").each_with_index do |row, index|
      if (id == index+1)
        gossips << Gossip.new(row[0], row[1])   
        break
          end
        end
        return gossips
    end
  
    # Modifies the cvs with new input from user
    def self.update(id,author,content)
      gossips = []
     
      CSV.read("./db/gossip.csv").each_with_index do |row, index|
        if id.to_i == (index + 1)    # i 
          gossips << [author, content]
        else
          gossips << [row[0], row[1]]
        end
      end
  
      CSV.open("./db/gossip.csv", "w") do |csv| 
        gossips.each do |row|
          csv << row
      end
    end
  
  end



end
# binding.pry

