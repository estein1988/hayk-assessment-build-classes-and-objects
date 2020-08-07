require 'pry'

class Building
    attr_accessor :name, :number_of_tenants
    attr_reader :address

    @@all = []

    def initialize(name, address, number_of_floors, number_of_tenants)
        @name = name 
        @address = address
        @number_of_floors = number_of_floors
        @number_of_tenants = number_of_tenants
        @@all << self
    end 

    def self.all
        @@all 
    end 

    def self.average_tenants
        total_tenants = @@all.reduce(0) do |sum, building|
            sum + building.number_of_tenants
        end
        total_tenants / @@all.length
    end 

    def name_and_address
        "#{name} #{address}"
    end 

    def tenants_per_floor
        @number_of_tenants.to_f / @number_of_floors
    end

    def self.total_tenants 
        @@all.reduce(0) do |sum, building|
            sum + building.number_of_tenants
        end 
    end

end

house = Building.new("Denver House", "1400 Logan", 14, 100)
car = Building.new("White House", "1600 Penn", 15, 600)
apartment = Building.new("My House", "6164 Allison Street", 10, 50)