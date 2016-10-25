# frozen_string_literal: true
class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title = title

    # TODO: check class
    @author = author
  end

  def to_s
    "#{@title} : #{@author.name}"
  end
end
