require_relative('../modules/terminalShow.rb')
require 'yaml'
class Library
	include TerminalShow
	attr_reader :books ,:orders, :readers, :authors

	def initialize(books, orders, readers, authors)
		#TODO check class
		@books = books
		@orders = orders
		@readers = readers
		@authors = authors
	end

	def export(file_path, method='YAML')
		if method.downcase == 'yaml'
			File.open(file_path,'w') {|f| f.write(YAML.dump(self))}
		end
		if method.downcase == 'serialize'
			File.open(file_path,'w') {|f| f.write(Marshal.dump(self))}
		end
		file_path
	end

	def self.import(file_path, method='YAML')
		if File.file?(file_path)
			if method.downcase == 'yaml'
				obj =  YAML.load(File.read(file_path)) 
			end
			if method.downcase == 'serialize'
				obj = Marshal.load(File.read(file_path)) 
			end
		end

		obj.class == self ? obj : (raise ArgumentError ,'Incorrect file')
	end

	def getStats
		putSeparator('The most popular book:')
		puts mostPopularBook
		putSeparator('Who often takes the book:')
		puts bestReader
		putSeparator('How many people ordered one of the three most popular books:')
		puts readersWhoOrderPopularBook.count
	end

	private
	def mostPopularBook(books_count = 1)
		#v1 ?
		# booksRate = Hash[ self.orders.map { |v| [ v.book, condition with v] } ]
		
		#v2 done !
		# booksRate = Hash.new{0}
		# self.orders.each{ |order| booksRate[order.book] += 1}
		# (booksRate.select {|k,v| k if v == booksRate.values.max }).keys
		
		#v3 count books are paremetr! for fun countReadersWhoOrderPopularBook
		booksRate = Hash.new{0}
		self.orders.each{ |order| booksRate[order.book] += 1}
		booksRate.sort_by {|book,orders_count| orders_count}.reverse.to_h.keys[0...books_count]
	end

	def bestReader(readers_count = 1)
		#TODO the same fun as mostPopularBook // create lambda or prok ?
		readersRate = Hash.new{0}
		self.orders.each{ |order| readersRate[order.reader] +=1}
		readersRate.sort_by{|reader,orders_count| orders_count}.reverse.to_h.keys[0...readers_count]
	end

	def readersWhoOrderPopularBook(books_count = 3)
		#TODO One line code ?
		mostPopularBooks = mostPopularBook(3)
		self.orders.group_by {|order| order.book}
			.map{|book,order| order if mostPopularBooks.include?(book)}.compact
			.flatten.uniq{|order| order.reader}
	end

end