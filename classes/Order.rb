class Order
	attr_reader :book ,:reader, :date

	def initialize(book, reader)
		@date = Time.now.strftime("%d/%m/%Y %H:%M")

		#TODO check class
		@book = book
		@reader = reader
	end

end