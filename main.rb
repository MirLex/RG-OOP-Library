require_relative('lib/person')
require_relative('lib/author')
require_relative('lib/reader')
require_relative('lib/book')
require_relative('lib/order')
require_relative('lib/library')
require_relative('test_data')
require_relative('modules/terminalShow.rb')

include TerminalShow

putSeparator('Start')
begin
  library = Library.import('./data/library.yaml')
  puts 'Successfully imported file'
rescue ArgumentError => e
  puts 'ERROR:' + e.message
  library = Library.import(createTestData)
  puts 'Load Test Data'
end

library.get_stats
putSeparator
