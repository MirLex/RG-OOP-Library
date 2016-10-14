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
			File.open(file_path +'.yaml','w') {|f| f.write(YAML.dump(self))}
		end
		if method.downcase == 'serialize'
			File.open(file_path +'.dat','w') {|f| f.write(Marshal.dump(self))}
		end	
	end

	def self.import(file_path, method='YAML')
		if method.downcase == 'yaml'
			return YAML.load(File.read(file_path + '.yaml'))
		end
		if method.downcase == 'serialize'
			return Marshal.load(File.read(file_path + '.dat'))		
		end	
	end

end