require_relative('../modules/terminalShow.rb')
require_relative('../modules/dataTransfer.rb')
require 'yaml'

class Library
  include TerminalShow
  include DataTransfer
  attr_reader :books, :orders, :readers, :authors

  def initialize(books, orders, readers, authors)
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
  end

  def get_stats
    putSeparator('The most popular book:')
    puts most_active(:book, 1)
    putSeparator('Who often takes the book:')
    puts most_active(:reader, 1)
    putSeparator('How many people ordered one of the three most popular books:')
    puts readers_who_order_popular_book.count
  end

  private

  def most_active(obj, count)
    result = Hash.new { 0 }
    orders.each { |order| result[order.send(obj)] += 1 }
    result.sort_by { |_obj, orders_count| orders_count }
          .reverse.to_h.keys[0...count]
  end

  def readers_who_order_popular_book(_books_count = 3)
    most_popular_books = most_active(:book, 3)
    orders.group_by(&:book)
          .map { |book, order| order if most_popular_books.include?(book) }
          .compact
          .flatten.uniq(&:reader)
  end
end
