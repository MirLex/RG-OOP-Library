require_relative('../modules/terminalShow.rb')
require_relative('../modules/dataTransfer.rb')
require 'yaml'
require 'pry'

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
    puts most_active(:book)
    putSeparator('Who often takes the book:')
    puts most_active(:reader)
    putSeparator('How many people ordered one of the three most popular books:')
    puts readers_who_order_popular_book.count
  end

  private

  def most_active(obj, count = 1)
    orders.group_by { |order| order.send(obj) }
          .sort_by { |_book, orders| -orders.size }
          .to_h.keys[0...count]
  end

  def readers_who_order_popular_book(books_count = 3)
    most_popular_books = most_active(:book, books_count)
    orders.group_by(&:book)
          .map { |book, order| order if most_popular_books.include?(book) }
          .compact
          .flatten.uniq(&:reader)
  end
end
