class Author < Person
	attr_accessor :biography

	def initialize(name,biography)
		@biography = biography
		super(name)
	end

end