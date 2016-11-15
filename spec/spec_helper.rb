require 'bundler/setup'
# require_relative('../classes/Library')
require_relative('../lib/person')
require_relative('../lib/author')
require_relative('../lib/reader')
require_relative('../lib/book')
require_relative('../lib/order')
require_relative('../lib/library')
require_relative('../test_data')
require_relative('../modules/terminalShow.rb')
require('pry')

RSpec.configure do |c|
  c.formatter = :documentation
  c.color = true
end
