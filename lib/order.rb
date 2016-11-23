class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader)
    @date = Time.now.strftime('%d/%m/%Y %H:%M')
    @book = book
    @reader = reader
  end

  def to_s
    "#{@book.title}/#{@reader.name}"
  end
end
