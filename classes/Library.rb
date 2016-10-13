class Library
	attr_reader :books ,:orders, :readers, :authors

	def initialize(books, orders, readers, authors)
		#TODO check class
		@books = books
		@orders = orders
		@readers = readers
		@authors = authors
	end

end