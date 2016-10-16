class Reader < Person
	attr_accessor :biography, :email, :city, :street, :house

	def initialize(name, email, city, street, house)
		@email = email
		@city = city
		@street = street
		@house = house
		super(name)
	end

	def to_s
		"#{@name}"
	end
end