require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

uber = Startup.new("uber", "john smith", "google")
dominos = Startup.new("dominos", "Tony Pizza", "microsoft")
blimpies = Startup.new("blimpies", "Tommy Salami", "minecraft")
tacobell = Startup.new("tacobell", "john smith", "firefox")

billgates= VentureCapitalist.new("Bill Gates", 56000000000)
elonmusk = VentureCapitalist.new("Elon Musk", 32000000000)
tommy = VentureCapitalist.new("Tommy", 32000)

f1 = FundingRound.new(uber, elonmusk, "seed", 45000000.00)
f2 = FundingRound.new(dominos, billgates, "pres eed", 600000000.00)
f3 = FundingRound.new(blimpies, tommy, "series a", 20000.00)
f4 = FundingRound.new(uber, billgates, "seed b", 500000)
f5= FundingRound.new(uber, elonmusk, "seed a", 1505000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line