require_relative('classes/Person')
require_relative('classes/Author')
require_relative('classes/Reader')
require_relative('classes/Book')
require_relative('classes/Order')
require_relative('classes/Library')
require_relative('test_data')

#TODO put it to module?
def putSeparator(message = '',length = 80)
	length.times{print '_'}
	puts "\n" + message.to_s 
end


putSeparator('Start')
begin
  library = Library.import('./data/library.yaml')
  puts "Successfully imported file" 
rescue ArgumentError => e
  puts "ERROR:" + e.message
  library = Library.import(createTestData)
  puts "Load Test Data"
end
putSeparator('End')

library.getStats