require 'yaml'
class Library
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
		self.instance_variables.each {|var| puts "#{var[1..-1].capitalize}: #{var.size}"}
		puts mostPopularBook
		puts bestReader
		puts countReadersWhoOrderPopularBook
	end

	private
	def mostPopularBook(books_count = 3)
		#v1 ?
		# booksRate = Hash[ self.orders.map { |v| [ v.book, condition with v] } ]
		
		#v2 done !
		# booksRate = Hash.new{0}
		# self.orders.each{ |order| booksRate[order.book] += 1}
		# (booksRate.select {|k,v| k if v == booksRate.values.max }).keys
		
		#v3 count books are paremetr! for fun countReadersWhoOrderPopularBook
		booksRate = Hash.new{0}
		self.orders.each{ |order| booksRate[order.book] += 1}
		booksRate.sort_by {|k,v| v}.reverse.to_h.keys[0...books_count]
	end

	def bestReader(readers_count = 1)
		readersRate = Hash.new{0}
		self.orders.each{ |order| readersRate[order.reader] +=1}
		readersRate.sort_by{|r,v| v}.reverse.to_h.keys[0...readers_count]
	end

	def countReadersWhoOrderPopularBook(books_count = 3)
		#TODO One line code
		mostPopularBooks = mostPopularBook(3)
		ordersOfBook =  self.orders.group_by {|order| order.book}
		ordersWithPopBook = ordersOfBook.map{|book,v| v if mostPopularBooks.include?(book)}.compact
		uniqReaders = ordersWithPopBook.flatten.uniq{|order| order.reader}
		uniqReaders.size
	end

end