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
		mostPopularBook
		bestReader
		countReadersWhoOrderPopularBook
	end

	private
	def mostPopularBook

	end

	def bestReader
	
	end

	def countReadersWhoOrderPopularBook(books_count = 3)
	
	end

end