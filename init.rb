require_relative('classes/Person')
require_relative('classes/Author')
require_relative('classes/Reader')
require_relative('classes/Book')
require_relative('classes/Order')
require_relative('classes/Library')
require_relative('test_data')
require_relative('modules/terminalShow.rb')

include TerminalShow

putSeparator('Start')
begin
  library = Library.import('./data/library.yaml')
  puts "Successfully imported file" 
rescue ArgumentError => e
  puts "ERROR:" + e.message
  library = Library.import(createTestData)
  puts "Load Test Data"
end

library.getStats
putSeparator