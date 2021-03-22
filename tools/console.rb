require "pry"
require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end



bill = VentureCapitalist.new("Bill Gates",1_000_000_000)
elon = VentureCapitalist.new("Elon Musk",2_000_000_000)
joe = VentureCapitalist.new("Joe C",100_000)
mike = VentureCapitalist.new("Mike L",500_000)



deckdrive = Startup.new("Deck Drive","Dickens Drivovich", "deckdrive.com")
packme = Startup.new("Max Packer","Caleb Daniel", "maxpacker.com")

hsight = Startup.new("H Sight","Somi  Kim", "hsight.com")
kdata= Startup.new("Key Data","Misael Lopez", "kdata.com")

contract1 = FundingRound.new(kdata, mike, "A Round", 254321)
contract2 = FundingRound.new(packme, bill, "B Round", 1230154)
contract3 = FundingRound.new(hsight, elon, "C Round", 500000)
contract4 = FundingRound.new(packme, elon, "A Round", 22200)
contract5 = FundingRound.new(packme, bill, "B Round", 4554554)

packme.total_funds

mike.offer_contract(kdata,"B Round",22200)

VentureCapitalist.invested("maxpacker.com")
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line