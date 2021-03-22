class FundingRound
    @@all = []
    attr_accessor :type, :investment
    
    attr_reader :startup, :venture_capitalist
    def initialize(startup,venture_capitalist,type,investment = 0.00)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end

    def self.all
        @@all
    end

    

end
# series_a = FundingRound(kdata, mike, "A Round", 254321)

#### Build out the following methods on the `FundingRound` class

# - `FundingRound#startup`
#   - returns the startup object for that given funding round
#   - Once a funding round is created, I should not be able to change the startup
# - `FundingRound#venture_capitalist`
#   - returns the venture capitalist object for that given funding round
#   - Once a funding round is created, I should not be able to change the venture capitalist
# - `FundingRound#type`
#   - returns a **string** that is the type of funding round
#   - Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
# - `FundingRound#investment`
#   - returns a **number** that is the amount invested during this funding round
#   - This should be a float that is not a negative number.
# - `FundingRound.all`
#   - returns all of the funding rounds
