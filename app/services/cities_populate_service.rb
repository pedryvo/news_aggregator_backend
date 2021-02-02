module CitiesPopulateService
  class Main
    def initialize
    end

    def states
      http = File.read(File.join(Rails.root, 'app','services','states.json'))
      JSON.parse http
    end
  
    def capital?(city, state)
      city["name"] == state["capital"]
    end
  
    def populate
      states.each do |state|
        region_obj = Region.find_or_create_by(:name => state["region"])
        state_obj = State.new(:acronym => state["acronym"], :name => state["name"], :region => region_obj)
        state_obj.save
  
        state["cities"].each do |city|
          c = City.new
          c.name = city["name"]
          c.state = state_obj
          c.capital = capital?(city, state)
          c.save
          puts "Adicionando a cidade #{c.name} ao estado #{c.state.name}"
        end
      end
    end
    
  end
end
