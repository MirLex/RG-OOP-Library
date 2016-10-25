# frozen_string_literal: true
require_relative('../modules/terminalShow.rb')
require 'yaml'
class Library
  include TerminalShow
  attr_reader :books, :orders, :readers, :authors

  def initialize(books, orders, readers, authors)
    # TODO: check class
    @books = books
    @orders = orders
    @readers = readers
    @authors = authors
  end

  def export(file_path, method = 'YAML')
    if method.casecmp('yaml').zero?
      File.open(file_path, 'w') { |f| f.write(YAML.dump(self)) }
    end
    if method.casecmp('serialize').zero?
      File.open(file_path, 'w') { |f| f.write(Marshal.dump(self)) }
    end
    file_path
  end

  def self.import(file_path, method = 'YAML')
    if File.file?(file_path)
      obj = YAML.load(File.read(file_path)) if method.casecmp('yaml').zero?
      if method.casecmp('serialize').zero?
        obj = Marshal.load(File.read(file_path))
      end
    end

    obj.class == self ? obj : (raise ArgumentError, 'Incorrect file')
  end

  def get_stats
    putSeparator('The most popular book:')
    puts get_best(:book, 1)
    putSeparator('Who often takes the book:')
    puts get_best(:reader, 1)
    putSeparator('How many people ordered one of the three most popular books:')
    puts readers_who_order_popular_book.count
  end

  private

  def get_best(obj, count)
    lambda do |obj, count|
      result = Hash.new { 0 }
      orders.each { |order| result[order.send(obj)] += 1 }
      result.sort_by { |_obj, orders_count| orders_count }
            .reverse.to_h.keys[0...count]
    end.call(obj, count)
  end

  def readers_who_order_popular_book(_books_count = 3)
    most_popular_books = get_best(:book, 3)
    orders.group_by(&:book)
          .map { |book, order| order if most_popular_books.include?(book) }
          .compact
          .flatten.uniq(&:reader)
  end
end
