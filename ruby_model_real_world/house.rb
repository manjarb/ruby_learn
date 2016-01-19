class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost

  #def initialize(address, square_feet, num_bedrooms = 3, num_baths = 2, cost = 320_000, down_payment = 0.20, sold = false, has_tenants = false)
  def initialize(house_materials = {})
    @address = house_materials.fetch(:address)
    @square_feet = house_materials.fetch(:square_feet)
    @num_bedrooms = house_materials.fetch(:num_bedrooms){ 3 }
    @num_baths = house_materials.fetch(:num_baths){ 2 }
    @cost = house_materials.fetch(:cost){320000}
    @down_payment = house_materials.fetch(:down_payment){0.20}
    @sold = house_materials.fetch(:sold){ false }
    @short_sale = house_materials.fetch(:short_sale){ false }
    @has_tenants = house_materials.fetch(:has_tenants){ false }
  end

  def obscure_address
    @address.sub(/\A\d*/, '****')
  end

  def buy!(money, good_credit)
    @sold = true if money >= down_payment && good_credit
  end

  def down_payment
    cost * @down_payment
  end

  def to_s
    puts "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
    #puts "#{@address} :#{@num_bedrooms}"
  end
end

house_materials = {
  :address => "Bkk",
  :square_feet => 30,
  :num_bedrooms => 20,
  :sold => true
}


house = House.new(house_materials)

house.to_s