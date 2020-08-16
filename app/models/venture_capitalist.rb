class VentureCapitalist 
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.filter{|vc| vc.total_worth > 1000000000}
    end    

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding| 
            funding.venture_capitalist == self
        end
    end

    def portfolio
        total = funding_rounds.map{|fr|fr.startup}
            total.uniq 
    end

    def biggest_investment
        self.funding_rounds.reduce do |fr1, fr2|
            if fr1.investment > fr2.investment
                fr1
            else
                fr2
            end
        end
    end

    # def invested(domain)
    #     self.funding_rounds.map{|s| s.domain == domain}
      
    # end
        
end
