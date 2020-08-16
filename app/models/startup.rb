class Startup
    attr_reader :founder
    attr_accessor :name, :domain
    @@all= []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    # def pivot(name, domain)
    #     to_update = self.st.find{|startup| startup.name == self}
    #     to_update.name = name 
    #     to_update.domain = domain
    # end

    def self.find_by_founder(founder)
        self.all.find{|startup| startup.founder == founder}
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    
    def funding_rounds 
        FundingRound.all.select{|fr| fr.startup == self}
    end
    
    def num_funding_rounds
        funding_rounds.count
    end
    
    def total_funds
        self.funding_rounds.map{|fr| fr.investment}.sum
    end
       
    def investors
        self.funding_rounds.map{|fr| fr.venture_capitalist}.uniq
    end

    def big_investors
        self.investors.select{|vc| vc.total_worth > 1000000000}.uniq 
    end
end
