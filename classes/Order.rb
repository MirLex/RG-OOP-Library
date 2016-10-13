class Order
	attr_reader :book ,:reader, :date

	def initialize(book, reader, date)
		@date = date

		#TODO check class
		@book = book
		@reader = reader
	end

end