require 'spec_helper'

RSpec.describe Library do
  let(:library) { Library.import(createTestData) }

  context '.new' do
    it 'create new library instance' do
      lib = Library.new(1, 2, 3, 4)
      expect(lib.class).to eq(Library)
    end
  end

  context '.import' do
    it 'import yaml file' do
      lib = Library.import('./data/library.yaml')
      expect(lib.books.count).to eq(8)
      expect(lib.readers.count).to eq(6)
      expect(lib.authors.count).to eq(6)
      expect(lib.orders.count).to eq(14)
    end
    it 'import serialize file' do
      lib = Library.import('./data/library.dat', 'serialize')
      expect(lib.books.count).to eq(8)
      expect(lib.readers.count).to eq(6)
      expect(lib.authors.count).to eq(6)
      expect(lib.orders.count).to eq(14)
    end
    it 'raise ArgumentError if Incorrect file' do
      expect { Library.import('IncorrectPath') }.to raise_error(ArgumentError)
    end
  end
end
