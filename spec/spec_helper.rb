require 'bundler/setup'
# require_relative('../classes/Library')
require_relative('../classes/Person')
require_relative('../classes/Author')
require_relative('../classes/Reader')
require_relative('../classes/Book')
require_relative('../classes/Order')
require_relative('../classes/Library')
require_relative('../test_data')
require_relative('../modules/terminalShow.rb')
require('pry')

RSpec.configure do |c|
  c.formatter = :documentation
  c.color = true
end
