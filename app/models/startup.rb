class Startup
    @@all = []
    attr_reader :name, :founder, :domain

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name=(name)
        @domain=(domain)
    end

    def self.all
        @@all
    end

    def sign_contract(venture_capitalist, investment = 0.00)
        FundingRound.new(self,venture_capitalist,"A Round", investment)

    end

    

    def num_funding_rounds
        FundingRound.all.select.count {|startup| startup.startup == self }
    end

    def total_funds
        total = 0.00
        FundingRound.all.select do |startup|
            startup.startup == self 
            total += startup.investment
        end
        total
    end


    def investors
        investors = []
        FundingRound.all.select do |startup|
            startup.startup == self
            investors << startup.venture_capitalist unless investors.include?(startup.venture_capitalist)
        end
        investors
    end

    def big_investors
        investors.select {|richest| richest.total_worth >= 1000000000 } 
    end
end






# - `Startup#name`
#   - returns a **string** that is the startup's name
# - `Startup#founder`
#   - returns a **string** that is the founder's name
#   - Once a startup is created, the founder cannot be changed.
# - `Startup#domain`
#   - returns a **string** that is the startup's domain
# - `Startup#pivot`
#   - given a string of a **domain** and a string of a **name**, change the domain
#     and name of the startup. This is the only public method through which the
#     domain should be changed.
# - `Startup.all`
#   - should return **all** of the startup instances
# - `Startup.find_by_founder`
#   - given a string of a **founder's name**, returns the **first startup** whose founder's name matches
# - `Startup.domains`
#   - should return an **array** of all of the different startup domains



#   ### Associations and Aggregate Methods

# #### Startup

# - `Startup#sign_contract`
#   - given a **venture capitalist object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
# - `Startup#num_funding_rounds`
#   - Returns the total number of funding rounds that the startup has gotten
# - `Startup#total_funds`
#   - Returns the total sum of investments that the startup has gotten
# - `Startup#investors`
#   - Returns a **unique** array of all the venture capitalists that have invested in this company
# - `Startup#big_investors`
#   - Returns a **unique** array of all the venture capitalists that have invested in this company and are in the Trés Commas club