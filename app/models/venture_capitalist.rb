class VentureCapitalist
    @@all = []

    attr_accessor :name, :total_worth
    
    def initialize(name, total_worth = 0)
        @name = name
        @total_worth = total_worth
        @@all << self
    end


    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|worth| worth.total_worth >= 1_000_000_000 }
    end
    
    def offer_contract(startup, type, investment = 0.00)
        FundingRound.new(startup,self,type,investment)
    end

    def funding_rounds
        FundingRound.all.select {|venture| venture.venture_capitalist == self}
    end

    def portfolio
        portfolio = funding_rounds.map {|ven| ven.startup}
        portfolio.uniq
    end

    def biggest_investment
        total = 0
        funding_rounds.map do |max_sum|
            if max_sum.investment > total
                biggest = max_sum
            end
        end
    end

    def self.invested(domain_arg)
        total = 0
        FundingRound.all.find_all do |dom| 
            dom.startup.domain == domain_arg
            # dom.startup.select {|dom1| dom1 == domain_arg }
            total += dom.investment
        end
        total

        return "the total amount invested in #{domain_arg} is $ #{total}"
    end
        




end


# - `VentureCapitalist#name`
#   - returns a **string** that is the venture capitalist's name
# - `VentureCapitalist#total_worth`
#   - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)
# - `VentureCapitalist.all`
#   - returns an array of all venture capitalists
# - `VentureCapitalist.tres_commas_club`
#   - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)



#   #### VentureCapitalist

# - `VentureCapitalist#offer_contract`
#   - given a **startup object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
# - `VentureCapitalist#funding_rounds`
#   - returns an array of all funding rounds for that venture capitalist
# - `VentureCapitalist#portfolio`
#   - Returns a **unique** list of all startups this venture capitalist has funded
# - `VentureCapitalist#biggest_investment`
#   - returns the largest funding round given by this venture capitalist
# - `VentureCapitalist#invested`
#   - given a **domain string**, returns the total amount invested in that domain


