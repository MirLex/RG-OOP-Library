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
		puts getBest(:book,1)
		putSeparator('Who often takes the book:')
		puts getBest(:reader,1)
		putSeparator('How many people ordered one of the three most popular books:')
		puts readersWhoOrderPopularBook.count
	end

	private

	def getBest(obj,count)
		lambda { |obj,count|
				result = Hash.new{0}
				self.orders.each{ |order| result[order.send(obj)] +=1}
				result.sort_by{|obj,orders_count| orders_count}.reverse.to_h.keys[0...count]
		}.call(obj,count)
	end

	def readersWhoOrderPopularBook(books_count = 3)
		mostPopularBooks = getBest(:book,3)
		self.orders.group_by {|order| order.book}
			.map{|book,order| order if mostPopularBooks.include?(book)}.compact
			.flatten.uniq{|order| order.reader}
	end

end